import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/widgets/alerts.dart';
import 'package:wob/widgets/button.dart';
import 'package:wob/widgets/entry_field.dart';

import '../../constants.dart';

class Details extends StatefulWidget {
  const Details(
      {Key? key,
      required this.nameController,
      required this.emailController,
      required this.pageController})
      : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final PageController pageController;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final formKey1 = GlobalKey<FormState>();
  final nameFocusNode = FocusNode();

  @override
  void initState() {
    nameFocusNode.requestFocus();
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
      child: Form(
        key: formKey1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Hi there, welcome!",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 5,
            ),
            EntryField(
              color: const Color(0xFFE2E3E0),
              title: "Your full name",
              controller: widget.nameController,
              focusNode: nameFocusNode,
              autoFocus: true,
            ),
            EntryField(
              color: const Color(0xFFE2E3E0),
              title: "Your email address",
              controller: widget.emailController,
              isSubmit: (_) {
                validateForm();
              },
              isEmail: true,
            ),
            const SizedBox(
              height: 5,
            ),
            MaterialBtn(
              onPressed: () {
                validateForm();
              },
              text: "Create new account",
              color: Get.isDarkMode
                  ? design.dark.secondary
                  : design.light.secondary,
              margin: const EdgeInsets.only(),
              isPrimary: true,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  validateForm() {
    if (widget.nameController.text.length > 2) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(widget.emailController.text)) {
        widget.pageController.animateToPage(2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else {
        Get.dialog(
          AlearBox(
            child: Text(
              "Please enter a valid email address",
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
            "Please enter your name",
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
