import 'dart:async';

import 'package:flutter_poc/screens/enquiry_information/ui/enquiry_information_page.dart';
import 'package:get/get.dart';

///this is the controller to handle all the business logic
///for Splash Screen
class SplashScreenController extends GetxController {
  navigateToNextScreen() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => EnquiryInformation());
    });
  }
}
