import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/dashboard/controller/dashboard_menu_controller.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({Key? key}) : super(key: key);

  @override
  _DashboardMenuState createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  final _dashboardMenuController = Get.put(DashboardMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: Responsive.isMobile(context)
              ? 1
              : Responsive.isTablet(context) ? 2 : 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            grid1(),
            grid2(),
            grid3(),
          ],
        ),
      ),
    );
  }

  Widget grid1() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 14, bottom: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child:
                          Text("Sample India", style: TextStyle(fontSize: 14)),
                    ),
                    Text("AAKFR1111P",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 13, top: 12, bottom: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text("Cibil Rank",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14)),
                    SizedBox(
                      height: 100,
                      child: Stack(
                        children: const [
                          CircularProgressIndicator(
                            strokeWidth: 20,
                            value: 50,
                          ),
                          Text("3",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 63, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Text("Rank",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13)),
                    const Text("Average",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18, top: 13, bottom: 32, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Delinquent Reported",
                        style: TextStyle(fontSize: 14)),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Your Institution",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text("No",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: ColourConstants.textDeclinedTitle)),
                            Text("Current",
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        ColourConstants.textDeclinedSubTitle)),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("No",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: ColourConstants.textDeclinedTitle)),
                            Text("Last 24 Months",
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        ColourConstants.textDeclinedSubTitle)),
                          ],
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text("Outside",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text("Yes",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: ColourConstants.textAcceptTitled)),
                            Text("Current",
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        ColourConstants.textDeclinedSubTitle)),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Yes",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: ColourConstants.textAcceptTitled)),
                            Text("Last 24 Months",
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        ColourConstants.textDeclinedSubTitle)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget grid2() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 13, right: 13, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    columnTitleSubTitleWidget("Name", "Sample India"),
                    columnTitleSubTitleWidget(
                        "Legal Constitution", "Private Limited"),
                    columnTitleSubTitleWidget(
                        "Class of Activity", "Casting of non-ferrous metals"),
                    Obx(() {
                      return Visibility(
                        visible:
                            !_dashboardMenuController.isHideBorrowerData.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            columnTitleSubTitleWidget("Business Category",
                                "Casting of non-ferrous metals"),
                            columnTitleSubTitleWidget("Industry Type", "Other"),
                            columnTitleSubTitleWidget(
                                "Sales Figure", "10,00,00,000 (Year: 2017)"),
                            columnTitleSubTitleWidget("No of Employees", "25"),
                            columnTitleSubTitleWidget(
                                "Date of Incorporation", "1-Apr-10"),
                          ],
                        ),
                      );
                    }),
                    TextButton(
                        onPressed: () {
                          _dashboardMenuController.isHideBorrowerData(
                              !_dashboardMenuController
                                  .isHideBorrowerData.value);
                        },
                        child: Text(
                          _dashboardMenuController.isHideBorrowerData.value
                              ? "View More"
                              : "View Less",
                          style:
                              const TextStyle(color: ColourConstants.primary),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, top: 13, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child:
                        Text("Enquiry Summary", style: TextStyle(fontSize: 14)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text("01",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColourConstants.textDeclinedTitle)),
                          Text("Total Enquiry",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedSubTitle)),
                        ],
                      ),
                      Column(
                        children: const [
                          Text("4,34,300",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColourConstants.textDeclinedTitle)),
                          Text("Enquiry Amount",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedSubTitle)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget grid3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text("Credit Profile Summary",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 13)),
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    const CircularProgressIndicator(
                      strokeWidth: 20,
                      value: 50,
                    ),
                    Column(
                      children: const [
                        Text("75 %",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                color: ColourConstants.progressPercentage)),
                        Text("Utilised",
                            style: TextStyle(
                                fontSize: 13,
                                color: ColourConstants.textDeclinedSubTitle)),
                      ],
                    ),
                  ],
                ),
              ),
              Responsive.isMobile(context)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            columnTitleSubTitleWidget("Total Lenders", "02"),
                            columnTitleSubTitleWidget("Total CF*(s)", "04"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              columnTitleSubTitleWidget("Total Lenders", "02"),
                              columnTitleSubTitleWidget("Total CF*(s)", "04"),
                            ],
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text("24,34,300",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColourConstants.textDeclinedTitle)),
                          const Text("Total Outstanding",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedSubTitle)),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("04",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: ColourConstants
                                              .textDeclinedSubTitle)),
                                  Text("Open CF",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: ColourConstants
                                              .textDeclinedSubTitle))
                                ],
                              )),
                              const Divider(),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("02",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: ColourConstants
                                              .textDeclinedSubTitle)),
                                  Text("Total Lenders",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: ColourConstants
                                              .textDeclinedSubTitle))
                                ],
                              )),
                              const Divider(),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("04",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: ColourConstants
                                              .textDeclinedSubTitle)),
                                  Text("Total CF*(s)",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: ColourConstants
                                              .textDeclinedSubTitle))
                                ],
                              ))
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
              Responsive.isMobile(context) ? const Divider() : Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text("Delinquent Summary",
                        style: TextStyle(fontSize: 14)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text("10,34,300",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColourConstants.textDeclinedTitle)),
                          Text("Total Outstanding",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedSubTitle)),
                        ],
                      ),
                      Column(
                        children: const [
                          Text("01",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColourConstants.textDeclinedTitle)),
                          Text("Delinquent CF",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedSubTitle)),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget columnTitleSubTitleWidget(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 13, color: ColourConstants.textDeclinedSubTitle)),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(subTitle,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
