import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/offers/helpers/card.dart';
import 'package:wob/offers/helpers/redeem.dart';

import '../constants.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final pageController = PageController(initialPage: 0);

  final nc = Get.put(NController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Claimed Offers',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:  Get.isDarkMode ? design.dark.secondary : design.light.secondary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              if (pageController.page!.round() == 0) {
                nc.currentPage = 0;
                nc.pageController.animateToPage(0,
                    duration: animationDuration, curve: Curves.easeInOut);
                nc.update();
              } else {
                pageController.animateToPage(
                  0,
                  duration: animationDuration,
                  curve: Curves.easeInOut,
                );
              }
            }),
        actions: [
          GestureDetector(
            child: Image.asset(
              "assets/icons/questions.png",
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          ListView(
            children: [
              Redeem(
                title: "Carlsberg Elephant",
                subtitle:
                    "Complete your Profile Your account has been created now. ",
                btn: "Redeem",
                onTap: () {
                  pageController.animateToPage(1,
                      duration: animationDuration, curve: Curves.easeInOut);
                },
                image: "assets/images/bottle-full-1.png",
                color: const Color(0xFF4C61E1),
                percent: "15% off",
              ),
              OfferCard(
                title: "🎉Extra ₹100 OFF🎉",
                subtitle:
                    "We are giving an extra ₹100 OFF is you pay now for your COD order.",
                btn: "Claim",
                onTap: () {},
                image: "assets/images/special-offers.png",
                color: Colors.black,
              ),
            ],
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Today",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const HeaderBuild(
                trailing: "-23 pt.",
                title: "Carlsberg Elephant",
                date: "20 January, 2019",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Yesterday",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const HeaderBuild(
                trailing: "-15 pt.",
                title: "Franz Ferdinand",
                date: "19 January, 2019",
              ),
              const HeaderBuild(
                trailing: "₹ 345",
                title: "Agents Jaks Bar",
                date: "19 January, 2019",
                data: [
                  {
                    "item": "Orange Juice",
                    "price": "₹ 345",
                  },
                ],
              ),
              const HeaderBuild(
                trailing: "₹ 1345",
                title: "Agents Jaks Bar",
                date: "19 January, 2019",
                data: [
                  {
                    "item": "Orange Juice",
                    "price": "₹ 345",
                  },
                  {
                    "item": "Liquir Beer",
                    "price": "₹ 1000",
                  },
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderBuild extends StatelessWidget {
  final String title;
  final String date;
  final String trailing;
  final List? data;
  const HeaderBuild({
    Key? key,
    required this.title,
    required this.date,
    required this.trailing,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      date,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: const Color(0xFF757F8C),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                trailing,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: const Color(0xFFFA2E69),
                    ),
              ),
            ],
          ),
          if (data != null)
            Column(
              children: [
                const Divider(
                  color: Color(0xFFC4C4C4),
                  thickness: 1,
                ),
                const SizedBox(height: 10),
                for (var i = 0; i < data!.length; i++)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data![i]['item'],
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: const Color(0xFF757F8C),
                                  ),
                        ),
                      ),
                      Text(
                        data![i]['price'],
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: const Color(0xFF757F8C),
                            ),
                      ),
                    ],
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
