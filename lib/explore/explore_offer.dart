import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wob/constants.dart';
import 'package:wob/functions.dart';
import 'package:wob/widgets/marquee.dart';
import 'package:wob/widgets/offer_card.dart';

class ExploreOffers extends StatefulWidget {
  const ExploreOffers({super.key});

  @override
  State<ExploreOffers> createState() => _ExploreOffersState();
}

class _ExploreOffersState extends State<ExploreOffers> {
  int selectedIndex = 0;
  final scrollController1 = ScrollController();
  @override
  Widget build(BuildContext context) {
    List categories = [
      "Beer",
      "Rum",
      "Wine",
      "Gin",
      "Vodka",
      "Whiskey",
      "Tequila",
      "Cognac",
      "Brandy",
      "Liqueur",
      "Cocktails",
      "Mixers",
      "Spirits",
      "Other"
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 5,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/brands/tonique.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tonique - asia's \nlargest liquor boutique",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tonique has a collection of 100 Indian wines alone, and almost all of the younger beer brands the country ... Asia's largest liquor store in Namma Bengaluru.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: MaterialButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(12),
                      color: const Color(0xFFFAAB1B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Open Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Text(
                            '4.6',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: isPortrait(context) ? 60 : 80,
              color: Colors.black,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/bubble_3.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: primaryColor,
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              child: Marquee(
                child: Row(
                  children: [
                    for (var i = 0; i < 10; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            width: 8,
                            height: 8,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'The products are sold or displayed only inside the store range',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                  ],
                ),
                autoRepeat: true,
                forwardAnimation: Curves.linear,
                direction: Axis.horizontal,
                directionMarguee: DirectionMarguee.oneDirection,
                pauseDuration: const Duration(seconds: 0),
                animationDuration: const Duration(seconds: 8 * 10),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF3F1D7A).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Search brands, stores',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'exclusive WOB store offers',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 225,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        for (int i = 0; i < 6; i++)
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 20,
                              left: i == 0 ? 0 : 5,
                              right: i == 5 ? 0 : 5,
                            ),
                            child: OfferItemCard(
                              title: 'CHEERS\nCHEERS\nCHEERS',
                              subtitle: 'Beer O crat',
                              brandImg: "assets/brands/1 (" +
                                  (i + 1).toString() +
                                  ").png",
                              background: "assets/images/" +
                                  (i % 2 == 0 ? "offer.png" : "offer2.png"),
                              claimOffer: true,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'curated brands made for you',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Shop for 2000 more to collect 12% points and unlock gold membership",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 75,
                    child: ListView(
                      controller: scrollController1,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (75 / 2),
                        ),
                        for (int i = 0; i < 6; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = i;

                                scrollController1.animateTo(
                                  (i * 85).toDouble(),
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                            child: Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: selectedIndex == i
                                      ? Colors.black
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              alignment: Alignment.center,
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      "assets/brands/1 (" +
                                          (i + 1).toString() +
                                          ").png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (75 / 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'shop by category',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      height: 30,
                      child: Row(
                        children: const [
                          Text(
                            'View all',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF3F1D7A),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Color(0xFF3F1D7A),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  for (int i = 0; i < categories.length; i++)
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: 100,
                        width: 75,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.only(left: 5, right: 5),
                        padding: const EdgeInsets.all(12.5),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFC4C4C4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              categories[i],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Whiskey \nand ice and \neverything nice.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      height: 1,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF000000).withOpacity(0.1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Made in namma bengaluru",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF000000).withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
