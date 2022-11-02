import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/main/mainscreen.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF482D92), Color(0xFF622CAA)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            PermissionCard(
              image: Icons.bluetooth,
              title: "Required Bluetooth",
              subTitle:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et.",
              ontap: () {},
            ),
            PermissionCard(
              image: Icons.location_on,
              title: "Location",
              subTitle:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et.",
              ontap: () {},
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height * 0.083, //60
              decoration: BoxDecoration(
                color: const Color(0xFFFDDD00),
                borderRadius: BorderRadius.circular(
                  60,
                ),
              ),
              child: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Grant Permision",
                      style: TextStyle(
                          color: Color(0xFF482482),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF482482),
                    )
                  ],
                ),
                onTap: () {
                  Get.to(
                    const MainScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionCard extends StatelessWidget {
  final IconData image;
  final String title;
  final String subTitle;
  final Function ontap;
  const PermissionCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Center(
              child: Icon(
                image,
                size: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
