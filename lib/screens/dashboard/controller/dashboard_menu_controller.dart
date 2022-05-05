import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/commerical/commercial_screen.dart';
import 'package:get/get.dart';

class DashboardMenuController extends GetxController {
  var isVisibleBorrowerData = true.obs;

  late TabController tabController;
  late TabController tabController2;


  void navigateToNewCommercial() {
    Get.to(() => const CommercialScreen());
  }
}
