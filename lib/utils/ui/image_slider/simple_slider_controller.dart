import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// Manage all ImageSliderWidget business logic here
class SimpleSliderController extends GetxController {
  late List<String> imageUrls;
  late double imageHeight;

  List<Widget> pages = [];

  final pageController = PageController(initialPage: 0, keepPage: true);
}
