import 'package:flutter/material.dart';

// All of our constant stuff

const kPrimaryColor = Color(0xFF366CF6);
const kSecondaryColor = Color(0xFFF5F6FC);
const kBgLightColor = Color(0xFFF2F4FC);
const kBgDarkColor = Color(0xFFEBEDFA);
const kBadgeColor = Color(0xFFEE376E);
const kGrayColor = Color(0xFF8793B2);
const kTitleTextColor = Color(0xFF30384D);
const kTextColor = Color(0xFF4D5875);

const kDefaultPadding = 20.0;
Color Kblue = Color(0xFFD5E78FF);

const Color primary = Colors.black;
const  red = Colors.red;
const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color green = Colors.green;
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);

const defaultPadding = 16.0;
const primaryColorO = Color(0xFFf64f11);
const secondaryColorR = Color(0xFFb60036);
const SideMenuColor = Color(0xFFb60036);
const SideMenuColor1 = Color(0xdfea2424);
const bgColor1 = Color(0xd7ffffff);
const CardColor = Color(0xffffffff);
const blueFont = Color(0xFF2A2D3E);
const blueFont2 = Color(0xFF212332);
const defaultPadding1 = 10.0;
const orange = Colors.orange;

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}



InputDecoration DecoTitre( String titre,String hint,Icon leftIcon){
  return InputDecoration(
    label: Text(titre),
    prefixIcon: leftIcon,
    floatingLabelStyle: TextStyle(color: Colors.blue.withOpacity(0.5),
        fontSize: 20),
    border: InputBorder.none,
    hintText: 'EX: '+ hint,
    hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
    // errorText: errorText,
    // errorStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
  );
}
InputDecoration DecoSubject( String titre,String hint,Icon leftIcon){
  return InputDecoration(
    label: Text(titre),
    floatingLabelStyle: TextStyle(color: Colors.blue.withOpacity(0.5),
        fontSize: 20),
    border: InputBorder.none,
    hintText: 'EX: '+ hint,
    hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
    prefixIcon: leftIcon,
    // errorText: errorText,
    // errorStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
  );
}
