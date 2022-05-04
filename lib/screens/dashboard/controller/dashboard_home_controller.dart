import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:get/get.dart';

// Defined a class for each menu
class MenuItem {
  String title; // menu title
  IconData icon; // menu icon/image
  bool isActive; // to find menu is active of not
  DASHBOARD_MENU menuType; // used to change menu

  MenuItem(this.title, this.icon, this.isActive, this.menuType);
}

class DashboardHomeController extends GetxController {
  var listOfMenuItem = <MenuItem>[].obs; // List of items in menu
  var currentMenu = DASHBOARD_MENU.dashboard.obs; // To store last selected menu

  @override
  void onInit() {
    super.onInit();
    getMenuList();
  }

  getMenuList() {
    List<MenuItem> list = [];
    list.add(MenuItem(
        "Dashboard",
        Icons.dashboard_rounded,
        currentMenu.value == DASHBOARD_MENU.dashboard,
        DASHBOARD_MENU.dashboard));
    list.add(MenuItem("New Data", Icons.add_circle_outlined,
        currentMenu.value == DASHBOARD_MENU.newData, DASHBOARD_MENU.newData));
    list.add(MenuItem("Message", Icons.chat_bubble_outlined,
        currentMenu.value == DASHBOARD_MENU.message, DASHBOARD_MENU.message));
    listOfMenuItem.value = list;
    print("---updated--");
  }

  updateCurrentMenu(DASHBOARD_MENU menu) {
    currentMenu(menu);
    getMenuList();
  }
}
