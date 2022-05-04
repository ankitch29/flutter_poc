import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/dashboard/ui/dashboard.dart';
import 'package:flutter_poc/screens/dashboard/ui/side_menu_drawer.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
        tablet: getDesktopAndTabletDesign(), // made both tablet & desktop same design
        desktop: getDesktopAndTabletDesign(),
        mobile: const DashboardPage());
  }

  Widget getDesktopAndTabletDesign() {
    var _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20,top: 5,bottom: 8),
          child: Image.asset("images/logo_name_blue.png",width: _size.width/7),
        ),
        const Divider(color: ColourConstants.accent),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: _size.width > 1000 ? 2 : 3,
                child: SideMenu(),
              ),
              Expanded(
                flex: 8,
                child: Container(color: ColourConstants.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
