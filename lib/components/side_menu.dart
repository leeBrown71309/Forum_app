import 'package:flutter/material.dart';
import 'package:outlook/responsive.dart';
import 'package:outlook/screens/main/components/create_post.dart';
import 'package:outlook/screens/main/components/profile.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import '../extensions.dart';
import 'side_menu_item.dart';
import 'tags.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  FlutterLogo(),
                  Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (builder){
                        return CreatePost();
                      }
                  ));
                },
                icon: Icon(Icons.post_add_rounded,size: 16,color: Colors.white,),
                label: Text(
                  "New post",
                  style: TextStyle(color: Colors.white),
                ),
              ).addNeumorphism(
                topShadowColor: Colors.white,
                bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
              ),
              SizedBox(height: kDefaultPadding),
              FlatButton.icon(
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: kBgDarkColor,
                onPressed: () {},
                icon: Icon(Icons.message,size: 16,color: Colors.blue,),
                label: Text(
                  "Get messages",
                  style: TextStyle(color: kTextColor),
                ),
              ).addNeumorphism(),
              SizedBox(height: kDefaultPadding * 2),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "All threads",
                icon: Icon(Icons.document_scanner_rounded,size: 16,color: Colors.blue,),
                isActive: false,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {
                  Navigator.push((context),
                      MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                },
                icon: Icon(Icons.person_outline,size: 16,color: Colors.blue,),
                title: "My profile",
                // iconSrc: "assets/Icons/Send.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                icon: Icon(Icons.emoji_people_rounded,size: 16,color: Colors.blue,),
                title: "My participation",
                // iconSrc: "assets/Icons/File.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                icon: Icon(Icons.question_answer,size: 16,color: Colors.blue,),
                title: "My best answers",
                // iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),
              SideMenuItem(
                press: () {},
                icon: Icon(Icons.follow_the_signs_outlined,size: 16,color: Colors.blue,),
                  title: "Following",
                // iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),
              SideMenuItem(
                press: () {},
                icon: Icon(Icons.star,size: 16,color: Colors.blue,),
                  title: "Popular this week",
                // iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),
              SideMenuItem(
                press: () {},
                icon: Icon(Icons.star,size: 16,color: Colors.blue,),
                  title: "Popular all time",
                // iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),
              SideMenuItem(
                press: () {},
                icon: Icon(Icons.check_circle,size: 16,color: Colors.blue,),
                  title: "Solved",
                // iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),
              SideMenuItem(
                press: () {},
                icon: Icon(Icons.check_circle,size: 16,color: Colors.blue,),
                  title: "Unsolved",
                // iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),

              SizedBox(height: kDefaultPadding * 2),
              // Tags
            ],
          ),
        ),
      ),
    );
  }
}
