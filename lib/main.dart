import 'package:flutter/material.dart';
import 'package:outlook/constants.dart';
import 'package:outlook/screens/main/main_screen.dart';
import 'package:sizer/sizer.dart';

import 'auth/sign_and_login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return buildMaterialApp(context, LoginSignupScreen());
    });
  }
}

MaterialApp buildMaterialApp(BuildContext context, var main) {
  return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SupForum',
        initialRoute: '/',
        routes: {
          '/': (context) =>  LoginSignupScreen(),

        },
      );


}
