import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outlook/auth_services.dart';
import 'package:outlook/screens/main/main_screen.dart';
import 'package:http/http.dart' as http;

import '../api_links.dart';
import '../constants.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  // bool isMale = true;
  bool isRememberMe = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String name = "";
  String password = "";
  String email = "";
  bool showShadow = false;

  ifRegister() async{
    http.Response response = await AuthServices.register(
        nameController.text,
        emailController.text,
        pwdController.text
    );
    Map responseMap = jsonDecode(response.body);
    if(response.statusCode == 200){
      Navigator.push((context),
          MaterialPageRoute(builder: (context) {
            return MainScreen();
          }));
    }else{
      errorSnackbar(context, responseMap.values.first[0]);
    }
  }

  ifLogin() async {
    http.Response response = await AuthServices.login(
        emailController.text,
        pwdController.text,

    );
    Map responseMap = jsonDecode(response.body);
    if(response.statusCode == 200){
      Navigator.push((context),
          MaterialPageRoute(builder: (context) {
            return MainScreen();
          }));
    }else{
      errorSnackbar(context, responseMap.values.first);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    pwdController.dispose();
    emailController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/background.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: kPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Bienvenue ",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: white,
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? "Sur SupForum," : "...",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Identifiez vous pour Continuer"
                          : "Enregistrez vous pour Continuer",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          //button(),
          // buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          Form(
            key: _formkey,
            child: AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
              top: isSignupScreen ? 200 : 230,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.bounceInOut,
                height: isSignupScreen ? 380 : 250,
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5),
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: kPrimaryColor,
                                  )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSignupScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1),
                                ),
                                if (isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.orange,
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isSignupScreen) buildSignupSection(),
                      if (!isSignupScreen) buildSigninSection()
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          // button()
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 535 : 430,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      if (showShadow)
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1.5,
                          blurRadius: 10,
                        )
                    ]),
                child: !showShadow
                    ? GestureDetector(
                        onTap: () {
                          if (_formkey.currentState.validate()) {
                            isSignupScreen ?
                              ifRegister() :
                              ifLogin();

                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.orange.shade200,
                                    Colors.red.shade400
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 1))
                              ]),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Center(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.mail_outline_outlined, "Axel124@gmail.com", false, true, emailController,
              name, "Entrer votre login"),
          SizedBox(
            height: 10,
          ),
          buildTextField(Icons.lock_outline, "**********", true, false,
              pwdController, password, "Entrer votre mot de passe"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Mot de passe oublié?",
                        style:
                            TextStyle(fontSize: 12, color: Palette.textColor1)),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.person, "Nom Utilisateur", false, false,
              nameController, name, "Entrer votre nom"),
          SizedBox(
            height: 10,
          ),
          buildTextField(Icons.email_outlined, "email", false, true,
              emailController, email, "Entrer votre mail"),
          SizedBox(
            height: 10,
          ),
          buildTextField(Icons.lock_outline, "Mot de passe", true, false,
              pwdController, password, "Entrer votre mot de passe"),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Avant de valider rassurez-vous vos données ",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "sont correcte",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget button() {
    return IconButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/mainscreen'),
        icon: Icon(
          Icons.arrow_forward,
          color: white,
        ));
  }

  TextFormField buildTextField(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
    onChanged,
    String validator,
  ) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => setState(() => onChanged = value),
      validator: (value) => value.isEmpty ? validator : null,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Palette.iconColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
      ),
    );
  }
}
