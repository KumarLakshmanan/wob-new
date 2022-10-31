import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/storeoffer/helpers/redeem.dart';

import '../constants.dart';

class StoreOffer extends StatefulWidget {
  const StoreOffer({Key? key}) : super(key: key);

  @override
  StoreOfferState createState() => StoreOfferState();
}

class StoreOfferState extends State<StoreOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store Offers List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            Get.isDarkMode ? design.dark.secondary : design.light.secondary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          GestureDetector(
            child: Image.asset(
              "assets/icons/questions.png",
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Redeem(
            title: "TUBORG STRONG BEER",
            subtitle:
                "Complete your Profile Your account has been created now. ",
            btn: "Redeem",
            onTap: () {},
            image: "assets/images/bottle-full-1.png",
            color: const Color(0xFFF3B66F),
            percent: "15% off",
            isView: true,
          ),
          Redeem(
            title: "Carlsberg Elephant",
            subtitle:
                "Complete your Profile Your account has been created now. ",
            btn: "Redeem",
            onTap: () {},
            image: "assets/images/bottle-full-1.png",
            color: const Color(0xFF954AF3),
            percent: "15% off",
            isView: true,
          ),
        ],
      ),
    );
  }
}
