import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import 'counter_badge.dart';

class SideMenuItem extends StatefulWidget {
  const SideMenuItem({
    Key key,
    this.isActive,
    this.itemCount,
    this.showBorder = true,
    this.icon,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final bool isActive, showBorder;
  final int itemCount;
  final String  title;
  final Widget icon;
  final VoidCallback press;

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: AnimatedContainer(
        // height:50,//there should be outline/dimensions for the box.
        //Otherway, You can use positioned widget
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.only(top: (isHover) ? 5 : 10.0, bottom:!(isHover)? 5:10),
        child: InkWell(
          onTap: widget.press,
          onHover: (e){
            setState(() {
              isHover = e;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (isHover)
                  ? widget.icon
                  : SizedBox(width: 15),
              SizedBox(width: kDefaultPadding / 4),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 15, right: 5),
                  decoration: widget.showBorder
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Color(0xFFDFE2EF)),
                          ),
                        )
                      : null,
                  child: Row(
                    children: [
                      SizedBox(width: kDefaultPadding * 0.75),
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.button.copyWith(
                              color:
                                  (widget.isActive || isHover) ? kTextColor : kGrayColor,
                            ),
                      ),
                      Spacer(),
                      if (widget.itemCount != null) CounterBadge(count: widget.itemCount)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
