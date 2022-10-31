import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/widgets/alerts.dart';
import 'package:wob/widgets/button.dart';
import 'package:wob/widgets/entry_field.dart';

import '../../constants.dart';

class Phone extends StatefulWidget {
  final TextEditingController phoneController;
  final PageController pageController;
  const Phone(
      {Key? key, required this.phoneController, required this.pageController})
      : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final phoneFocusNode = FocusNode();
  @override
  void initState() {
    phoneFocusNode.requestFocus();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 15,
        bottom: 10,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Verify your phone number",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Convallis vestibulum augue massa sed aenean.",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 15,
          ),
          EntryField(
            color: const Color(0xFFE2E3E0),
            title: "Your Phone Number",
            controller: widget.phoneController,
            isPhone: true,
            autoFocus: true,
            isSubmit: (_){
              validateForm();
            },
            focusNode: phoneFocusNode,
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialBtn(
            onPressed: () {
              validateForm();
            },
            text: "Create new account",
            color:
                Get.isDarkMode ? design.dark.secondary : design.light.secondary,
            margin: const EdgeInsets.only(),
            isPrimary: true,
            height: 50,
          ),
        ],
      ),
    );
  }

  validateForm() {
    if (widget.phoneController.text.isNotEmpty) {
      if (widget.phoneController.text.length == 10 &&
          RegExp(r'^[0-9]{10}$').hasMatch(widget.phoneController.text)) {
        widget.pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        Get.dialog(
          AlearBox(
            child: Text(
              "Please enter a valid phone number",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } else {
      Get.dialog(
        AlearBox(
          child: Text(
            "Please enter your phone number",
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
