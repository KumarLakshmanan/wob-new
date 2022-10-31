import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class SwitchBuilder extends StatefulWidget {
  final String title;
  final bool isOn;
  final Function onToggle;
  const SwitchBuilder(
      {Key? key,
      required this.title,
      required this.isOn,
      required this.onToggle})
      : super(key: key);

  @override
  _SwitchBuilderState createState() => _SwitchBuilderState();
}

class _SwitchBuilderState extends State<SwitchBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          FlutterSwitch(
            width: 40,
            borderRadius: 20,
            padding: 2,
            height: 24,
            toggleSize: 20,
            value: widget.isOn,
            onToggle: (value) {
              widget.onToggle(value);
            },
            activeColor:
                Get.isDarkMode ? design.dark.primary : design.light.primary,
          ),
        ],
      ),
    );
  }
}
