import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/widgets/button.dart';

import '../constants.dart';
import 'helpers/redeem.dart';

class StoreOfferDetails extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final String percent;
  final Color color;
  const StoreOfferDetails({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
    required this.percent,
  }) : super(key: key);

  @override
  _StoreOfeerDetailsState createState() => _StoreOfeerDetailsState();
}

class _StoreOfeerDetailsState extends State<StoreOfferDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store Offers Detail',
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
              "assets/icons/share.png",
              width: 30,
              height: 30,
            ),
          ),
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
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Redeem(
                title: widget.title,
                subtitle: widget.subtitle,
                btn: "",
                onTap: () {},
                image: widget.image,
                color: widget.color,
                percent: widget.percent,
                showBtn: false,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Carlsberg Elephant",
                    style: Theme.of(context).textTheme.headline3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Convallis vestibulum augue massa sed aenean.",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Terms and Codition",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Get.isDarkMode
                          ? design.dark.textcolor
                          : design.light.textcolor),
                ),
              ),
              BulletedList(
                listItems: [
                  for (var i = 0; i < 3; i++)
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Convallis vestibulum augue massa sed aenean.",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                    )
                ],
                listOrder: ListOrder.unordered,
                bulletColor: Get.isDarkMode
                    ? design.dark.secondary
                    : design.light.secondary,
                boxShape: BoxShape.rectangle,
                bulletType: BulletType.conventional,
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: MaterialBtn(
              height: 50,
              onPressed: () {
                Get.dialog(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? design.dark.background2
                              : design.light.background2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/icons/claim.png',
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                            ),
                            Text(
                              "Claim success",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: const Color(0xFF00CCB2),
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Your Offer has been confirmed, You can check directly in to the Home screen.",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: Get.isDarkMode
                                          ? design.dark.textcolor
                                          : design.light.textcolor),
                            ),
                            const SizedBox(height: 20),
                            MaterialBtn(
                              height: 50,
                              margin: const EdgeInsets.all(0),
                              onPressed: () {
                                Get.back();
                                Get.back();
                                Get.back();
                              },
                              color: Get.isDarkMode
                                  ? design.dark.secondary
                                  : design.light.secondary,
                              isPrimary: true,
                              text: "Go to Homepage",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  barrierDismissible: false,
                );
              },
              color: Get.isDarkMode
                  ? design.dark.secondary
                  : design.light.secondary,
              text: "Claim Now",
              isPrimary: true,
            ),
          ),
        ],
      ),
    );
  }
}
