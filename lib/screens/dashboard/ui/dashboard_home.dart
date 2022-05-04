import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/dashboard/controller/dashboard_home_controller.dart';
import 'package:flutter_poc/screens/dashboard/ui/dashboard_menu.dart';
import 'package:flutter_poc/screens/dashboard/ui/mobile_dashboard.dart';
import 'package:flutter_poc/screens/dashboard/ui/side_menu_drawer.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';
import 'package:get/get.dart';

class DashboardInheritedWidget extends InheritedWidget {
  final DashboardHomeController homeController;

  const DashboardInheritedWidget(
      {Key? key, required Widget child, required this.homeController})
      : super(key: key, child: child);

  static DashboardInheritedWidget of(BuildContext context) {
    var dashboardProvider =
        context.dependOnInheritedWidgetOfExactType<DashboardInheritedWidget>()!;
    return dashboardProvider;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final _homeController = Get.put(DashboardHomeController());

  @override
  Widget build(BuildContext context) {
    return DashboardInheritedWidget(
      homeController: _homeController,
      child: Responsive(
          tablet: getDesktopAndTabletDesign(),
          // made both tablet & desktop same design
          desktop: getDesktopAndTabletDesign(),
          mobile: const DashboardPage()),
    );
  }

  Widget getDesktopAndTabletDesign() {
    var _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5, bottom: 8),
          child:
              Image.asset("images/logo_name_blue.png", width: _size.width / 7),
        ),
        const Divider(color: ColourConstants.accent),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: _size.width > 1000 ? 2 : 3,
                child: const SideMenu(),
              ),
              Expanded(
                flex: 8,
                child: MenuSelectedWidget(_homeController),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuSelectedWidget extends StatelessWidget {
  final DashboardHomeController _homeController;

  const MenuSelectedWidget(this._homeController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (_homeController.currentMenu.value) {
        case DASHBOARD_MENU.dashboard:
          return const DashboardMenu();
        case DASHBOARD_MENU.newData:
          return Container(color: Colors.black);
        case DASHBOARD_MENU.message:
          return Container(color: Colors.red);
        default:
          return const DashboardMenu();
      }
    });
  }
}
