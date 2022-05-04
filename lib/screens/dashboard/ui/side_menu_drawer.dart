import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/dashboard/controller/dashboard_home_controller.dart';
import 'package:flutter_poc/screens/dashboard/ui/dashboard_home.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';
import 'package:get/get.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late DashboardHomeController homeController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeController = DashboardInheritedWidget.of(context).homeController;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Responsive.isMobile(context)
                  ? Container(
                      color: ColourConstants.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                              "images/logo_icon.png",
                              width: size.height / 10,
                            ),
                          ),
                          const Expanded(
                            child: ListTile(
                              title: Text("User Name"),
                              subtitle: Text("123456789"),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(),
              GetX<DashboardHomeController>(builder: (controller) {
                return ListView.separated(
                    itemCount: homeController.listOfMenuItem.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        indent: 45,
                      );
                    },
                    itemBuilder: (context, index) {
                      var item = homeController.listOfMenuItem[index];
                      return InkWell(
                        onTap: () {
                          homeController.updateCurrentMenu(item.menuType);
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Row(
                              children: [
                                Icon(item.icon,
                                    color: item.isActive
                                        ? ColourConstants.primary
                                        : null,
                                    size: size.height / 30),
                                SizedBox(width: size.height / 30),
                                Text(item.title,
                                    style: TextStyle(
                                        color: item.isActive
                                            ? ColourConstants.primary
                                            : null,
                                        fontSize: size.height / 35)),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
