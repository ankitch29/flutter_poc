import 'package:flutter/material.dart';
import 'package:get/get.dart';

///this is the controller to handle all the business logic
///for Initial screen
class InitialController extends GetxController {
  pressMe() {
    Get.snackbar('Hello', 'Welcome to Flutter!',
    backgroundColor: Colors.yellow
    );
  }
}
