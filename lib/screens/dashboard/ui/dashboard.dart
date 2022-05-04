import 'package:flutter/material.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // to open & close drawer in android

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // only if mobile then drawer will visible
      drawer: Responsive.isMobile(context)
          ? ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: SideMenu(),
            )
          : Container(),
      appBar: AppBar(
        backgroundColor: ColourConstants.accent,
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
      ),
    );
  }
}
