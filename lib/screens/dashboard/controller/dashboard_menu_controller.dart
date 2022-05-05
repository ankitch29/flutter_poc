import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/commerical/commercial_screen.dart';
import 'package:get/get.dart';

class DashboardMenuController extends GetxController {
  var isVisibleBorrowerData = true.obs;

  late TabController tabController;
  late TabController tabController2;

  //
  late PageController pageController;
  late PageController pageController2;

  @override
  void onReady() {
    super.onReady();
    tabController.addListener(() {
      pageController.animateToPage(
        tabController.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
    tabController2.addListener(() {
      pageController2.animateToPage(
        tabController2.index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
    //
    pageController.addListener(() {
      tabController.animateTo(
        pageController.page?.toInt() ?? 0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
    pageController2.addListener(() {
      tabController2.animateTo(
        pageController2.page?.toInt() ?? 0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  void navigateToNewCommercial() {
    Get.to(() => const CommercialScreen());
  }
}
