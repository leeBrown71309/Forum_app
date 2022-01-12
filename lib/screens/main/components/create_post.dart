import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:outlook/extensions.dart';
import 'package:outlook/screens/email/components/header.dart';
import 'package:sizer/sizer.dart';
import '../../../api_links.dart';
import '../../../auth_services.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import 'list_of_emails.dart';
import 'package:http/http.dart' as http;

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PostForm(),
          )
        ],
      ),
    );
  }
}

class PostForm extends StatefulWidget {
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  int idCat;
  String nomCat;
  bool idSelect = false;
  var titre;
  var content;
  bool isHover = false;
  List items = [];

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController titreController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future getData1() async {
    final http.Response response = await http.get(Uri.parse(getAllCategories));
    if (response.statusCode == 200) {
      // setState(() {
      //   isLoading = false;
      // });
      items = jsonDecode(response.body);
      print(items);
    }else{
      print("nooooo");
    }
  }

  PostTopics() async{
    http.Response response = await AuthServices.PostTopics(
        titreController.text,
        contentController.text,
        idCat
    );
    Map responseMap = jsonDecode(response.body);
    if(response.statusCode == 200){
      // Navigator.push((context),
      //     MaterialPageRoute(builder: (context) {
      //       return MainScreen();
      //     }));
      errorSnackbar(context, "reussi");
    }else{
      errorSnackbar(context, "error");
    }
  }


  showMenu() {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              color: Colors.blue,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Catégories",
                      style: TextStyle(
                        color: white,
                        fontFamily: 'mont',
                        fontSize: 18,
                      ),),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                      height: Responsive.isMobile(context) ?
                      MediaQuery.of(context).size.height * 0.5
                          :
                      MediaQuery.of(context).size.height * 0.7,

                      width: Responsive.isMobile(context) ?
                      MediaQuery.of(context).size.width * 0.9
                          :
                      MediaQuery.of(context).size.width * 0.5,

                      margin: EdgeInsets.only(top: 6.h),
                      decoration: BoxDecoration(
                        color: kBgDarkColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index)=> AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.only(top: (isHover) ? 5 : 10.0, bottom:!(isHover)? 5:10),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                idSelect = true;
                              });
                              idCat = items[index]["id"];
                              nomCat = items[index]["nom"];
                              print(items[index]["id"]);
                            },
                            onHover: (e){
                              setState(() {
                                isHover = e;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kBgLightColor
                                    ),
                                    child: Text( items[index]["nom"] )
                                ).addNeumorphism(
                                  blurRadius: 15,
                                  borderRadius: 15,
                                  offset: Offset(5, 5),
                                  topShadowColor: Colors.white60,
                                  bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
                                ),
                                SizedBox(height: 10,)
                              ],
                            ),
                          ),
                        ),
                      )

                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  // _insert() {
  //   var values = {
  //     'title': titreController.text,
  //     'content': contentController.text,
  //   };
  //   var req = CallApiPost();
  //   req.postData(values, storeAllTopics);
  //   setState(() {
  //     titreController.text = "";
  //     contentController.text = "";
  //   });
  // }


  @override
  void initState() {
    super.initState();
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Text(
            "Titre",
            // textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'mont'),
          ),
          Container(
            decoration: BoxDecoration(
                color: kBgLightColor, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextFormField(
                controller: titreController,
                onChanged: (value) => setState(() => titre = value),
                validator: (value) => value.isEmpty ? "Entrer un titre" : null,
                style: TextStyle(
                  color: Colors.black54,
                ),
                decoration: DecoTitre(
                    "nom du sujet",
                    "Comment ...",
                    // "Veuillez entrer un titre",
                    Icon(Icons.edit, color: Colors.blue.withOpacity(0.5))),
              ),
            ),
          ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 25,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15)),
          SizedBox(
            height: 10,
          ),
          Text(
            "Content",
            // textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'mont'),
          ),
          Container(
            decoration: BoxDecoration(
                color: kBgLightColor, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextFormField(
                maxLines: 10,
                controller: contentController,
                onChanged: (value) => setState(() => content = value),
                validator: (value) =>
                    value.isEmpty ? "Entrer votre sujet" : null,
                style: TextStyle(
                  color: Colors.black54,
                ),
                decoration: DecoSubject(
                    "Saisissez votre sujet",
                    "Je voudrais savoir comment...",
                    // "Veuillez entrer un titre",
                    Icon(Icons.subject, color: Colors.blue.withOpacity(0.5))),
              ),
            ),
          ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 25,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15)),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: (){
              showMenu();
            },
            color: kBgLightColor,
            child: Text("Catégories"),
          ).addNeumorphism(
            blurRadius: 15,
            borderRadius: 15,
            offset: Offset(5, 5),
            topShadowColor: Colors.white60,
            bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
          ),
          SizedBox(height: 20,),
          idSelect ? Text(nomCat):
          Text(""),
          SizedBox(
            height: 30,
          ),
          AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
              // height:50,//there should be outline/dimensions for the box.
              //Otherway, You can use positioned widget
              duration: Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                  top: (isHover) ? 5 : 10.0, bottom: !(isHover) ? 5 : 10),
              child: InkWell(
                onTap: () {
                  if(_formkey.currentState.validate()){
                    PostTopics();
                  }
                },
                onHover: (e) {
                  setState(() {
                    isHover = e;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Post",
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'mont',
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              )
          ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 25,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.10)),
        ],
      ),
    );
  }
}
