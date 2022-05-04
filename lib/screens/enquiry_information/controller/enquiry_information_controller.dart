import 'package:flutter_poc/screens/dashboard/ui/dashboard_home.dart';
import 'package:get/get.dart';

///this is the controller to handle all the business logic
///for Enquiry screen
class EnquiryInfoController extends GetxController {
  // Local images to slide list
  List<String> slideImages = [
    "images/slide_1.png",
    "images/slide_1.png",
    "images/slide_1.png"
  ];

  navigateToDashboard() {
    Get.offAll(() => const DashboardHome());
  }
}
