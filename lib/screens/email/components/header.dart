import 'package:flutter/material.dart';
import 'package:outlook/extensions.dart';
import 'package:outlook/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // We need this back button on mobile only
            if (!Responsive.isDesktop(context)) BackButton(color: Colors.white,),
            Center(
              child: Text("SupForum",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54
                  ),
                  child: Center(child: Icon(Icons.search_rounded,size: 25,color: Colors.white,)),
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 40,
                )
              ],
            )
          ],
        ),
      ).addNeumorphism(
        blurRadius: 15,
        borderRadius: 25,
        offset: Offset(5, 5),
        topShadowColor: Colors.white60,
        bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
      ),
    );
  }
}
