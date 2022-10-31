import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wob/constants.dart';

class CardOffers extends StatelessWidget {
  const CardOffers({
    Key? key,
    required this.image,
    required this.title,
    required this.number,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final String title;
  final String number;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                gradient: Get.isDarkMode
                    ? const LinearGradient(
                        colors: [
                          Color(0xFFf5ebda),
                          Color(0xFFf6d5ac),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      )
                    : const LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      image,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Get.isDarkMode
                              ? design.dark.secondary
                              : const Color(0xFF1C2D57),
                          // color: ,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              alignment: Alignment.center,
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? design.dark.secondary
                    : const Color(0xFF3B4DB9),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                    color: Get.isDarkMode
                        ? design.dark.secondary.withOpacity(0.3)
                        : const Color(0xFF3B4DB9).withOpacity(0.3),
                  ),
                ],
              ),
              child: Text(
                number,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
