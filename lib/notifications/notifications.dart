import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/controller/navigation.dart';

import '../constants.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isNotifications = true;
  final nc = Get.find<NController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:  Get.isDarkMode ? design.dark.secondary : design.light.secondary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            nc.currentPage = 0;
            nc.pageController.animateToPage(0,
                duration: animationDuration, curve: Curves.easeInOut);
            nc.update();
          },
        ),
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
      body: isNotifications
          ? ListView(
              shrinkWrap: true,
              children: const [
                NotificationTile(
                  title: "Special Offer",
                  time: "Today 10:00 AM",
                  subtitle:
                      "Congrats! You have been recieved an extra offer. Grab Here",
                ),
                NotificationTile(
                  title: "Special Offer",
                  time: "Today 10:00 AM",
                  subtitle:
                      "Congrats! You have been recieved an extra offer. Grab Here",
                ),
                NotificationTile(
                  title: "Special Offer",
                  time: "Today 10:00 AM",
                  subtitle:
                      "Congrats! You have been recieved an extra offer. Grab Here",
                ),
              ],
            )
          : Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/notification.png",
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Text(
                      "No notifications",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  const NotificationTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:  Get.isDarkMode ? design.dark.background2 : design.light.background2,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 75,
      child: Row(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
        color:  Get.isDarkMode ? Color.fromARGB(255, 100, 97, 97) : const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              "assets/images/celebration.png",
              width: 50,
              height: 50,
            ),
            alignment: Alignment.center,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
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
