import 'dart:convert';
import 'dart:math';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/extensions.dart';
import 'package:outlook/models/Email.dart';
import 'package:outlook/responsive.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:http/http.dart' as http;
import '../../../api_links.dart';
import '../../../constants.dart';
import '../../../loading.dart';
import 'comment_card.dart';
import 'email_card.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ListOfEmails extends StatefulWidget {
  // Press "Command + ."
  const ListOfEmails({
    Key key,
  }) : super(key: key);

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  var list = [];
  List items = [];
  bool isLoading = true;
  bool isActive = false;
  bool isHover = false;
  var cardImage = 'https://source.unsplash.com/random/800x600?person';

  Future getData() async {
    final http.Response response = await http.get(Uri.parse(getAllTopics));
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      list = jsonDecode(response.body);
    } else {
      list = ["null"];
    }
  }

  
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
                                onTap: (){},
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


  popUpError() {
    return NAlertDialog(
      title: Text("Attention!"),
      content: Text("Echec de connexion"),
      blur: 2,
    ).show(context, transitionType: DialogTransitionType.Bubble);
  }

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getData();
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              // This is our Seearch bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    // Once user click the menu icon the menu shows like drawer
                    // Also we want to hide this menu icon on desktop
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(
                                kDefaultPadding * 0.75), //15
                            child: Icon(
                              Icons.search_rounded,
                              size: 20,
                              color: Colors.black54,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: kDefaultPadding),
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

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

                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              isLoading
                  ? Center(child: Loading())
                  : list[0] == "null"
                  ? popUpError()
                  :
                  Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  // On mobile this active dosen't mean anything
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return CommentCard(info: list[index],);
                            }
                        ));
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                              color: isActive ? kPrimaryColor : kBgDarkColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 32,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey.withOpacity(0.5),
                                        backgroundImage: NetworkImage(cardImage),
                                      ),
                                    ),
                                    SizedBox(width: kDefaultPadding / 2),
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          text: list[index]["name"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                            color: isActive ? Colors.white : kTextColor,
                                          )
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          list[index]["created_at"],
                                          style: Theme.of(context).textTheme.caption.copyWith(
                                            color: isActive ? Colors.white70 : null,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        // if (widget.email.isAttachmentAvailable)
                                          Icon(Icons.push_pin_outlined,size: 16,color: Colors.grey,),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  list[index]["title"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: isActive ? Colors.white : kTextColor,
                                  ),
                                ),
                                SizedBox(height: kDefaultPadding / 2),
                                Text(
                                  list[index]["content"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                    height: 1.5,
                                    color: isActive ? Colors.white70 : null,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white54
                                  ),
                                  child: Text(list[index]["nom"]),
                                ).addNeumorphism(
                                  blurRadius: 15,
                                  borderRadius: 15,
                                  offset: Offset(5, 5),
                                  topShadowColor: Colors.white60,
                                  bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
                                ),
                              ],
                            ),
                          ).addNeumorphism(
                            blurRadius: 15,
                            borderRadius: 15,
                            offset: Offset(5, 5),
                            topShadowColor: Colors.white60,
                            bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
                          ),
                          // if (!widget.email.isChecked)
                          //   Positioned(
                          //     right: 8,
                          //     top: 8,
                          //     child: Container(
                          //       height: 12,
                          //       width: 12,
                          //       decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         color: kBadgeColor,
                          //       ),
                          //     ).addNeumorphism(
                          //       blurRadius: 4,
                          //       borderRadius: 8,
                          //       offset: Offset(2, 2),
                          //     ),
                          //   ),
                          // if (widget.email.tagColor != null)
                          //   Positioned(
                          //       left: 8,
                          //       top: 0,
                          //       child: Container()
                          //   )
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

