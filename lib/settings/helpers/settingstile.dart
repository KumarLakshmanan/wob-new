
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  const SettingsTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
        color: Get.isDarkMode ? design.dark.background2 : design.light.background2,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: Theme.of(context).textTheme.headline6),
          ),
           Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 20,
          ),
        ],
      ),
    );
  }
}
