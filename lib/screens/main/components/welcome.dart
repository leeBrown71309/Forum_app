import 'package:flutter/material.dart';
import 'package:outlook/screens/email/components/header.dart';

class Welcome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          SizedBox(height: 10,),
          Center(
            child: Text("Bienvenue sur SupForm",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'mont',
              color: Colors.black54
            ),),
          )
        ],
      ),
    );
  }
}
