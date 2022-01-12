import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:outlook/constants.dart';
import 'package:outlook/extensions.dart';
import 'package:outlook/responsive.dart';

import '../../../onHoverbutton.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var cardImage = 'https://source.unsplash.com/random/800x600?person';
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: kTitleTextColor,
        title: Text(
          "SupForum",
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'mont',
              fontWeight: FontWeight.w700,
              color: white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded, size: 30, color: white)),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: NetworkImage(cardImage),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.align_horizontal_right_rounded,
                size: 25,
                color: white,
              )),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: kBgDarkColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///header
            Container(
              color: kTitleTextColor,
              height: 550,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(children: [
                  ///circleAvatar
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.5),
                                          backgroundImage:
                                              NetworkImage(cardImage),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.only(
                              left: 60, right: 60, top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Text(
                                "nom user",
                                style: TextStyle(
                                    color: white,
                                    fontFamily: 'mont',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Membre de puis...",
                                style: TextStyle(
                                    color: white,
                                    fontFamily: 'mont',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RaisedButton(
                                onPressed: () {},
                                color: Colors.white54,
                                child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      color: white,
                                      fontFamily: 'mont',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// endCircleAvatar,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OnHoverCard(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: Responsive.isMobile(context)
                                        ? 200
                                        : Responsive.isTablet(context)
                                            ? 230
                                            : 230,
                                    width: Responsive.isMobile(context)
                                        ? 140
                                        : Responsive.isTablet(context)
                                            ? 160
                                            : 180,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.blueAccent.withOpacity(0.10),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star_outline_rounded,
                                          color: white,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'mont',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Total\n Experience",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'mont',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              OnHoverCard(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: Responsive.isMobile(context)
                                        ? 200
                                        : Responsive.isTablet(context)
                                            ? 230
                                            : 230,
                                    width: Responsive.isMobile(context)
                                        ? 140
                                        : Responsive.isTablet(context)
                                            ? 160
                                            : 180,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.blueAccent.withOpacity(0.10),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.book_outlined,
                                          color: white,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'mont',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Lessons\n Completed",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'mont',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              OnHoverCard(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: Responsive.isMobile(context)
                                        ? 200
                                        : Responsive.isTablet(context)
                                            ? 230
                                            : 230,
                                    width: Responsive.isMobile(context)
                                        ? 140
                                        : Responsive.isTablet(context)
                                            ? 160
                                            : 180,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.blueAccent.withOpacity(0.10),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.reply_all_rounded,
                                          color: white,
                                          size: 60,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "0",
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'mont',
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Best Reply\n Awards",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: white,
                                              fontFamily: 'mont',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    child: Column(
                      children: [
                        Text(
                          "My Topics",
                          style: TextStyle(
                              color: black,
                              fontFamily: 'mont',
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Divider(
                          color: Colors.blue,
                          thickness: 0.5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: Column(
                children: [
                  MyTopics(),
                  MyTopics(),
                ],
              ),
            ),

            ///footer
            Container(
              color: kTitleTextColor,
              height: 400,
              width: _size.width,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Want us to email you occasionally with SupForum news?",
                        style: TextStyle(
                            color: white,
                            fontFamily: 'mont',
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTopics extends StatefulWidget {
  @override
  _MyTopicsState createState() => _MyTopicsState();
}

class _MyTopicsState extends State<MyTopics> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: Responsive.isDesktop(context) ? 200 : 16,
          right: Responsive.isDesktop(context) ? 200 : 16,
          bottom: 20),
      child: Container(
        // height: Responsive.isMobile(context) ? 200 :  Responsive.isTablet(context) ? 230 :230,
        width: _size.width,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: kBgLightColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Titre du topics",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: black,
                  fontFamily: 'mont',
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Contenue du topics",
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: black,
                  fontFamily: 'mont',
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "dateTime",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: black,
                  fontFamily: 'mont',
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
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
    );
  }
}
