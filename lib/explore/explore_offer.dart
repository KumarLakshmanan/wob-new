import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExploreOffers extends StatefulWidget {
  const ExploreOffers({super.key});

  @override
  State<ExploreOffers> createState() => _ExploreOffersState();
}

class _ExploreOffersState extends State<ExploreOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            ExtendedSliverAppbar(
              isOpacityFadeWithTitle: true,
              toolBarColor: Colors.black,
              mainAxisAlignment: MainAxisAlignment.start,
              title: const Text(
                "Tonique",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              background: Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(14),
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
                                fontFamily: 'Gilroy',
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 10,
                            ),
                            Text(
                              '4.6',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
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
            ),
          ],
        ),
      ),
    );
  }
}
