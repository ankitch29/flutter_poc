import 'package:flutter_poc/screens/commerical/commercial_screen.dart';
import 'package:get/get.dart';

class DashboardMenuController extends GetxController {
  var isVisibleBorrowerData = true.obs;

  void navigateToNewCommercial() {
    Get.to(() => const CommercialScreen());
  }
}
