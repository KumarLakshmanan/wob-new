import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/detect/detect.dart';
import 'package:wob/home/helpers/popular.dart';
import 'package:wob/painters/radius.dart';
import 'package:wob/storeoffer/brandoffer.dart';
import 'package:wob/storeoffer/storeoffer.dart';
import 'package:wob/types/store_details.dart';
import 'package:wob/widgets/button.dart';

import 'helpers/carditem.dart';
import 'helpers/dialog.dart';
import 'helpers/myid.dart';
import 'helpers/cardoffers.dart';

class HomePage extends StatefulWidget {
  final StoreDetails? storeDetails;
  const HomePage({Key? key, this.storeDetails}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nc = Get.find<NController>();
  final dc = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: RadiusCliper(heightFactor: 60),
          child: Container(
            decoration: BoxDecoration(
              image: Get.isDarkMode
                  ? const DecorationImage(
                      image: AssetImage(
                        'assets/images/dark-pattern.png',
                      ),
                      fit: BoxFit.fitWidth,
                    )
                  : const DecorationImage(
                      image: AssetImage(
                        'assets/images/gold-bg.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
            ),
            height: 250,
            alignment: Alignment.topCenter,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20,
                left: 10,
                right: 10,
              ),
              child: Text(
                "Hi, Marcel",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Get.isDarkMode
                          ? design.dark.textcolor
                          : const Color(0xFF423F3F),
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.asset(
                    widget.storeDetails != null
                        ? "assets/images/store.png"
                        : "assets/images/hi.png",
                    width: 20,
                    height: 20,
                    color: const Color(0xFFFFC93F),
                  ),
                  const SizedBox(width: 10),
                  GetBuilder(
                      init: DataController(),
                      builder: (c) {
                        return Text(
                          widget.storeDetails != null
                              ? widget.storeDetails!.name +
                                  " - " +
                                  widget.storeDetails!.address +
                                  (dc.distanceStore != 0
                                      ? " (${dc.distanceStore} ft)"
                                      : "")
                              : "Welcome to W.O.B",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: Get.isDarkMode
                                      ? design.dark.textcolor
                                      : const Color(0xFF423F3F)),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/gold-card.png',
                    ),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Gold",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: const Color(0xFFC58812)),
                          ),
                        ),
                        Text(
                          "500",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Get.isDarkMode
                                      ? design.dark.secondary
                                      : design.light.secondary),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/mypoint.png',
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Row(
                        children: [
                          GoldCardItem(
                            image: 'assets/images/myid.png',
                            title: "My ID",
                            onTap: () {
                              Get.to(
                                const MyId(),
                                transition: Transition.rightToLeft,
                              );
                            },
                          ),
                          GoldCardItem(
                            image: 'assets/images/mypoint.png',
                            title: "+100 Point",
                            onTap: () {
                              Get.dialog(
                                const MainDialog(),
                              );
                            },
                          ),
                          GoldCardItem(
                            image: 'assets/images/mygold.png',
                            title: "Gold",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: widget.storeDetails != null
                  ? ListView(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              CardOffers(
                                image: 'assets/images/store-offer.png',
                                title: "Store Offer",
                                number: "35",
                                onTap: () {
                                  Get.to(
                                    const StoreOffer(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                              ),
                              const SizedBox(width: 10),
                              CardOffers(
                                image: 'assets/images/brand-offer.png',
                                title: "Brand Offer",
                                number: "2",
                                onTap: () {
                                  Get.to(
                                    const BrandOffer(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Popular Offiers",
                                  style: Theme.of(context).textTheme.headline6),
                              Text(
                                "View All",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: Get.isDarkMode
                                          ? design.dark.textcolor
                                              .withOpacity(0.4)
                                          : const Color(0xFF394EFB),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 275,
                            padding: const EdgeInsets.all(10),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(width: 10),
                                const Popular(
                                  color: Color(0xFF4C61E1),
                                  title: "CARLSBERG ELEPHANT",
                                  stitle: 'STRONG SUPER',
                                  time: "7 hours",
                                  offerImage: "assets/images/15%.png",
                                  image: "assets/images/ice-cold.png",
                                  drink: "assets/images/bottle-full-1.png",
                                ),
                                const SizedBox(width: 10),
                                const Popular(
                                  color: Color(0xFFF3B66F),
                                  title: "CARLSBERG ELEPHANT",
                                  stitle: 'STRONG SUPER',
                                  time: "7 hours",
                                  offerImage: "assets/images/15%.png",
                                  image: "assets/images/ice-cold.png",
                                  drink: "assets/images/bottle-full-1.png",
                                ),
                                const SizedBox(width: 10),
                                Popular(
                                  color: Get.isDarkMode
                                      ? design.dark.secondary
                                      : design.light.secondary,
                                  title: "CARLSBERG ELEPHANT",
                                  stitle: 'STRONG SUPER',
                                  time: "7 hours",
                                  offerImage: "assets/images/15%.png",
                                  image: "assets/images/ice-cold.png",
                                  drink: "assets/images/bottle-full-1.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Lets identify the store to provide \nyou the best offers",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Get.isDarkMode
                                        ? design.dark.textcolor
                                        : design.light.textcolor,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: MaterialBtn(
                              height: 50,
                              onPressed: () {
                                nc.isLogout();
                                Get.offAll(
                                  const Detect(),
                                  transition: Transition.rightToLeft,
                                );
                              },
                              color: Get.isDarkMode
                                  ? design.dark.secondary
                                  : design.light.secondary,
                              isPrimary: true,
                              text: "Detect Store",
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
