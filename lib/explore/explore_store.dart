import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/explore/explore_brand.dart';

class ExploreStore extends StatefulWidget {
  const ExploreStore({Key? key}) : super(key: key);

  @override
  _ExploreStoreState createState() => _ExploreStoreState();
}

class _ExploreStoreState extends State<ExploreStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "know your drink",
              style: TextStyle(color: Colors.black, fontSize: 14),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < 4; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                color: const Color(0xFF090217),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/redlabel.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "johnnie walker\nred label",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Highest selling scotch whiskey in the\nworld available in more than 180 countries",
                          style:
                              TextStyle(color: Color(0xFFFFFBEF), fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Get.to(
                              const ExploreBrand(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          color: const Color(0xFF41247B),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'Read more',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 12,
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
        ],
      ),
    );
  }
}
