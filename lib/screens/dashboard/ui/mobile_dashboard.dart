import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/dashboard/controller/dashboard_home_controller.dart';
import 'package:flutter_poc/screens/dashboard/ui/dashboard_home.dart';
import 'package:flutter_poc/screens/dashboard/ui/side_menu_drawer.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // to open & close drawer in android
  late DashboardHomeController _homeController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homeController = DashboardInheritedWidget.of(context).homeController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // only if mobile then drawer will visible
      drawer: Responsive.isMobile(context)
          ? ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: SideMenu(closeCallBack: () {
                if (!_scaffoldKey.currentState!.isDrawerOpen) {
                  _scaffoldKey.currentState!.openDrawer();
                } else {
                  Get.back();
                }
              }),
            )
          : Container(),
      appBar: AppBar(
        backgroundColor: ColourConstants.accent,
        title: getTitle(),
        centerTitle: true,
        leading: Responsive.isMobile(context)
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  if (!_scaffoldKey.currentState!.isDrawerOpen) {
                    _scaffoldKey.currentState!.openDrawer();
                  } else {
                    Get.back();
                  }
                })
            : Container(),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share))],
      ),
      body: MenuSelectedWidget(_homeController),
    );
  }

  Widget getTitle() {
    return Obx(() {
      switch (_homeController.currentMenu.value) {
        case DASHBOARD_MENU.dashboard:
          return const Text("Cibil Score");
        case DASHBOARD_MENU.newData:
          return const Text("New Data");
        case DASHBOARD_MENU.message:
          return const Text("Messages");
        case DASHBOARD_MENU.commercial:
          return const Text("Commercial");
        default:
          return const Text("Cibil Score");
      }
    });
  }
}
