import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/controller/data_controller.dart';
import 'package:wob/controller/navigation.dart';
import 'package:wob/lottery/jackpot.dart';
import 'package:wob/widgets/offer_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final nc = Get.find<NController>();
  final dc = Get.find<DataController>();
  int selectedIndex = 0;
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color(0xFF482D92),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Refer & Earn',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Icon(
              Icons.home_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Kalyannagar, Bangalore.',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Gilroy',
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF3F1D7A).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search brands, stores',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120 + (Get.width / 2.5),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF42247D),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Use your coins to\nclaim a reward now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  MaterialButton(
                                    onPressed: () {
                                      Get.to(
                                        () => const JackPot(),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    color: const Color(0xFFFAAB1B),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Claim Reward',
                                      style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 120 + ((Get.width / 2.5) / 2),
                    child: Container(
                      color: Colors.black,
                      height: 80,
                    ),
                  ),
                  Positioned(
                    right: -5,
                    left: 0,
                    top: 0,
                    child: Column(
                      children: [
                        const SizedBox(height: 120),
                        SizedBox(
                          height: Get.width / 2.5,
                          width: Get.width + 5,
                          child: Image.asset(
                            "assets/images/bubble_1.png",
                            width: Get.width,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      "assets/images/beercup.png",
                      height: Get.height * 0.2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Exclusive\nWorld of Brands",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Gilroy',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                                scrollController2.animateTo(
                                  (i * 260).toDouble(),
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
                                      ? Colors.white
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
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 225,
                    child: ListView(
                      controller: scrollController2,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (250 / 2),
                        ),
                        for (int i = 0; i < 6; i++)
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                              left: 5,
                              right: 5,
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
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (250 / 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 250,
                    width: Get.width,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: Get.width / 2.5,
                          width: Get.width,
                          child: Image.asset(
                            "assets/images/bubble_2.png",
                            width: Get.width,
                          ),
                        ),
                        Positioned(
                          top: Get.width / 5,
                          child: Container(
                            width: Get.width,
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            height: 250 - (Get.width / 5),
                            color: Colors.white,
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
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.1),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Made in namma bengaluru",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
