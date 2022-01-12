import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outlook/models/Email.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:http/http.dart' as http;

import '../../../api_links.dart';
import '../../../constants.dart';
import '../../../extensions.dart';

class EmailCard extends StatefulWidget {
  const EmailCard({
    Key key,
    this.isActive = true,
    this.email,
    this.press,
  }) : super(key: key);

  final bool isActive;
  final Topic email;
  final VoidCallback press;

  @override
  State<EmailCard> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {

  var list = [];
  bool isLoading = true;

  Future getData() async {
    final http.Response response = await http.get(Uri.parse(getAllTopics));
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      list = jsonDecode(response.body);
    } else {
      list = ["R.A.S"];
    }
  }

  @override
  Widget build(BuildContext context) {
    //  Here the shadow is not showing properly
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: widget.press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: widget.isActive ? kPrimaryColor : kBgDarkColor,
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
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(widget.email.image),
                        ),
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${widget.email.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: widget.isActive ? Colors.white : kTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: widget.email.subject,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      color:
                                          widget.isActive ? Colors.white : kTextColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            widget.email.time,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: widget.isActive ? Colors.white70 : null,
                                ),
                          ),
                          SizedBox(height: 5),
                          if (widget.email.isAttachmentAvailable)
                            Icon(Icons.push_pin_outlined,size: 16,color: Colors.grey,),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    widget.email.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          height: 1.5,
                          color: widget.isActive ? Colors.white70 : null,
                        ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54
                    ),
                    child: Text(widget.email.categorie),
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
            if (!widget.email.isChecked)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: Offset(2, 2),
                ),
              ),
            if (widget.email.tagColor != null)
              Positioned(
                left: 8,
                top: 0,
                child: Container()
              )
          ],
        ),
      ),
    );
  }
}
