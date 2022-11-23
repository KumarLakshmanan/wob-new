import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';
import 'package:wob/explore/explore_store.dart';

class ExploreBrand extends StatefulWidget {
  const ExploreBrand({Key? key}) : super(key: key);

  @override
  _ExploreBrandState createState() => _ExploreBrandState();
}

class _ExploreBrandState extends State<ExploreBrand> {
  double previousScrollPosition = 0.0;
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      previousScrollPosition = scrollController.position.pixels;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.7,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000000),
                  Color(0xFF000000),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Center(
                    child: Image.asset(
                      "assets/images/redlabel.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "johnnie walker\nred label",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Highest selling scotch whiskey in the\nworld available in more than \n180 countries",
                        style:
                            TextStyle(color: Color(0xFFFFFBEF), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -40,
                  child: GestureDetector(
                    onTap: () {
                      scrollController.animateTo(
                        previousScrollPosition + 50,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                      setState(() {
                        previousScrollPosition += 50;
                      });
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              color: Color(0xFF121330),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "read more",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "HISTORY",
                      style: TextStyle(
                          color: Color(0xFF41247B),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/johnnie.png",
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    const Text(
                        "In 1909, Special Old Highland Whiskey (crafted in 1867) was renamed Johnnie Walker Red Label. The striding man logo was designed in 1909 by Ton Browne"),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "AWARDS",
                      style: TextStyle(
                          color: Color(0xFF41247B),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "2 Le Monde Selection Grand Golds, 3 Golds at International Wine and Spirit Competition"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Color(0xFFEAEAEA),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Distinctive liquid notes",
                      style: TextStyle(
                          color: Color(0xFF090217),
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Taste",
                      style: TextStyle(color: Color(0xFFF6B513), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Crackling with Spice, Bursting with Vibrant Smoky Flavours. Distinct hint of Cinamon and Pepper.  Light Fruity Sweetness of fresh apple and pear and mellow vanilla. Long lingering smoky finish."),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Regions",
                      style: TextStyle(color: Color(0xFFF6B513), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Light Whiskies from Scotlands East coast and more peaty whiskies from West Coast",
                    ),
                    Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.fitWidth,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
