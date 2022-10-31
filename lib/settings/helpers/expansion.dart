import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class MyExpansionPanel extends StatefulWidget {
  final Widget child;
  final String title;
  const MyExpansionPanel({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  State<MyExpansionPanel> createState() => _MyExpansionPanelState();
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color:
            Get.isDarkMode ? design.dark.background2 : design.light.background2,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Transform.rotate(
                    angle: isExpanded ? 0 : -pi / 2,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(height: 0.0),
            secondChild: widget.child,
            firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
            secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
            sizeCurve: Curves.fastOutSlowIn,
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: animationDuration,
          ),
        ],
      ),
    );
  }
}
