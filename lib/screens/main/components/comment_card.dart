import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outlook/extensions.dart';
import 'package:outlook/models/comment_component.dart';
import 'package:outlook/screens/email/components/header.dart';
import 'package:sizer/sizer.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({
    Key key,
    this.info,
  }) : super(key: key);

  final Map info;

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly

    return Scaffold(
      backgroundColor: Color(0xFFF0F2F9),
      body: SingleChildScrollView(

        child: SafeArea(
          child: Column(
            children: [
              Header(),
              Divider(thickness: 1),
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, bottom: 16, left: 16, right: 16),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !Responsive.isMobile(context) && !Responsive.isTablet(context)
                            ? RichText(
                                text: TextSpan(
                                    text: widget.info["name"],
                                    style: TextStyle(
                                        color: Colors.blueGrey.withOpacity(1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                    children: [
                                    TextSpan(
                                      text: "  l'a Publié il y a ...",
                                      style: TextStyle(
                                          color: Colors.blueGrey.withOpacity(0.8),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]))
                            : Text(
                                " Publié il y a ...",
                                style: TextStyle(
                                    color: Colors.blueGrey.withOpacity(0.8),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey.withOpacity(0.3),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.blueGrey.withOpacity(0.7),
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "20",
                                      style: TextStyle(
                                          color: Colors.blueGrey.withOpacity(0.7),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.blueGrey.withOpacity(0.3),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.message_outlined,
                                      color: Colors.blueGrey.withOpacity(0.7),
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "20",
                                      style: TextStyle(
                                          color: Colors.blueGrey.withOpacity(0.7),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Center(
                                  child: Text(
                                    widget.info["nom"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ).addNeumorphism(
                  blurRadius: 15,
                  borderRadius: 15,
                  offset: Offset(5, 5),
                  topShadowColor: Colors.white60,
                  bottomShadowColor: Color(0xFF234395).withOpacity(0.10),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 16, left: 16, right: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.info["name"],
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey.withOpacity(0.10),
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.blueGrey.withOpacity(0.3),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "OP",
                                          style: TextStyle(
                                              color: Colors.blueGrey.withOpacity(0.7),
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                Text(
                                  "Publié il y a...",
                                  style: TextStyle(
                                    color: Colors.blueGrey.withOpacity(0.7),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                      // minWidth: 30.w,
                                      maxWidth: Responsive.isMobile(context)
                                          ? 65.w
                                          : Responsive.isDesktopMedium(context)
                                              ? 38.w
                                              : 40.w),
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blueGrey.withOpacity(0.10),
                                  ),
                                  child: Text(
                                    widget.info["title"],
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 30, right: 30, bottom: 10),
                        child: Container(
                          child: Text(
                            widget.info["content"],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16,
                                color: black.withOpacity(0.7),
                                fontFamily: "mont"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,bottom: 10),
                        child: Text(
                          widget.info["created_at"],
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        ShowReplySheet(),
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue.withOpacity(0.2))),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.withOpacity(0.7),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Répondre à "+widget.info["name"],
                              style: TextStyle(
                                  color: black.withOpacity(0.7),
                                  fontFamily: "mont",
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future ShowReplySheet() {
    return showStickyFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      headerHeight: 50,
      context: context,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      headerBuilder: (BuildContext context, double offset) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(offset == 0.8 ? 0 : 20),
              topRight: Radius.circular(offset == 0.8 ? 0 : 20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Reply to post',
                            style: TextStyle(
                                fontFamily: "mont",
                                fontSize: 18,
                                color: white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      bodyBuilder: (BuildContext context, double offset) {
        return SliverChildListDelegate(
          _children,
        );
      },
      anchors: [0, 0.5, 1],
    );
  }
}

List<Widget> _children = [
  Reply(),
];

class Reply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            autofocus: true,
            // expands: true,
            minLines: 1,
            maxLines: 100,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Type your text',
            ),
          ),
          Container(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RaisedButton(
                hoverColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.red.withOpacity(0.7),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: white,
                    fontFamily: 'mont',
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                hoverColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {},
                color: Colors.blue.withOpacity(0.7),
                child: Text(
                  'Post',
                  style: TextStyle(
                    color: white,
                    fontFamily: 'mont',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
