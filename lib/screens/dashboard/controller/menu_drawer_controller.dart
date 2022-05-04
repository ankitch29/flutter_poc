import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Defined a class for each menu
class MenuItem {
  String title; // menu title
  IconData icon; // menu icon/image
  bool isActive; // to find menu is active of not

  MenuItem(this.title, this.icon, this.isActive);
}

class MenuDrawerController extends GetxController {
  var listOfMenuItem = <MenuItem>[].obs; // List of items in menu
  int oldIndex = 0; // To store last selected index

  @override
  void onInit() {
    super.onInit();
    List<MenuItem> list = [];
    list.add(MenuItem("Dashboard", Icons.dashboard_rounded, true));
    list.add(MenuItem("New Data", Icons.add_circle_outlined, false));
    list.add(MenuItem("Message", Icons.chat_bubble_outlined, false));
    listOfMenuItem.value = list;
  }
}
