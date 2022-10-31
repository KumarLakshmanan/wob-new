import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class AlearBox extends StatelessWidget {
  final Widget child;
  const AlearBox({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Get.isDarkMode
                ? design.dark.background
                : design.light.background,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Material(
            color: Get.isDarkMode
                ? design.dark.background
                : design.light.background,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Get.isDarkMode
                              ? design.dark.secondary
                              : design.light.secondary,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                      child: Icon(Icons.close,
                          color: Get.isDarkMode
                              ? design.dark.secondary
                              : design.light.secondary,),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/icons/warning.png",
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
                const SizedBox(height: 10),
                child,
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
