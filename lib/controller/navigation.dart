import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NController extends GetxController{
  final PageController pageController = PageController();
  int currentPage = 0;
  isLogout() {
    currentPage = 0;
    pageController.jumpToPage(currentPage);
    update();
  }
}
