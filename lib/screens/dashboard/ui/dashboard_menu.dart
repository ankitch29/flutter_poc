import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/dashboard/controller/dashboard_home_controller.dart';
import 'package:flutter_poc/screens/dashboard/controller/dashboard_menu_controller.dart';
import 'package:flutter_poc/screens/dashboard/ui/dashboard_home.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({Key? key}) : super(key: key);

  @override
  _DashboardMenuState createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu>
    with TickerProviderStateMixin {
  final _dashboardMenuController = Get.put(DashboardMenuController());

  late DashboardHomeController homeController;

  @override
  void initState() {
    super.initState();
    _dashboardMenuController.tabController = TabController(
      length: 3,
      vsync: this,
    );
    _dashboardMenuController.tabController2 = TabController(
      length: 3,
      vsync: this,
    );
    //
    _dashboardMenuController.pageController = PageController(initialPage: 0,keepPage: true);
    _dashboardMenuController.pageController2 = PageController(initialPage: 0,keepPage: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeController = DashboardInheritedWidget.of(context).homeController;
  }

  @override
  Widget build(BuildContext context) {
    _dashboardMenuController
        .isVisibleBorrowerData(!Responsive.isMobile(context));
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: StaggeredGrid.count(
            crossAxisCount: Responsive.isMobile(context)
                ? 1
                : Responsive.isTablet(context)
                    ? 2
                    : 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              grid1(),
              grid2(),
              grid3(),
            ],
          ),
        ),
      ),
    );
  }

  Widget grid1() {
    return Column(
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
                    child: Text("Sample India", style: TextStyle(fontSize: 14)),
                  ),
                  Text("AAKFR1111P",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          child: InkWell(
            onTap: () {
              _dashboardMenuController.navigateToNewCommercial();
            },
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 13, top: 12, bottom: 32),
                child: Column(
                  children: [
                    const Text("Cibil Rank",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14)),
                    _buildRadialTextPointer(),
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
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("No",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedTitle)),
                          Text("Current",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedSubTitle)),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("No",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedTitle)),
                          Text("Last 24 Months",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: ColourConstants.textDeclinedSubTitle)),
                        ],
                      ))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Text("Outside",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget grid2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: DefaultTabController(
            length: 3,
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFededf0)),
                    padding: const EdgeInsets.all(2),
                    child: TabBar(
                      controller: _dashboardMenuController.tabController,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      labelPadding: const EdgeInsets.only(top: 5, bottom: 5),
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      labelColor: Colors.black,
                      unselectedLabelStyle:
                          const TextStyle(color: Colors.black, fontSize: 13),
                      tabs: const [
                        Text("Borrower"),
                        Text("Contact"),
                        Text("Identification"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Responsive.isMobile(context)? Get.height * 0.3: Get.height * 0.7,
                    child: Expanded(
                      child: TabBarView(
                          controller: _dashboardMenuController.tabController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13, right: 18, top: 18),
                              child: ListView(
                                children: [
                                  columnTitleSubTitleWidget("Name", "Sample India"),
                                  columnTitleSubTitleWidget(
                                      "Legal Constitution", "Private Limited"),
                                  columnTitleSubTitleWidget(
                                      "Class of Activity", "Casting of non-ferrous metals"),
                                  Obx(() {
                                    return Visibility(
                                      visible:
                                      _dashboardMenuController.isVisibleBorrowerData.value,
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
                                  Visibility(
                                    visible: Responsive.isMobile(context),
                                    child: Center(
                                      child: TextButton(
                                          onPressed: () {
                                            _dashboardMenuController.isVisibleBorrowerData(
                                                !_dashboardMenuController
                                                    .isVisibleBorrowerData.value);
                                          },
                                          child: Obx(
                                                () => Text(
                                              !_dashboardMenuController
                                                  .isVisibleBorrowerData.value
                                                  ? "View More"
                                                  : "View Less",
                                              style: const TextStyle(
                                                  color: ColourConstants.primary),
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13, right: 18, top: 18),
                              child: ListView(
                                children: [
                                  columnTitleSubTitleWidget("Mobile Number", "9876543210"),
                                  columnTitleSubTitleWidget("Telephone Number", "022-28000001"),
                                  columnTitleSubTitleWidget("Office Address", "10th Floor, ABC Tower, Veer Savarkar Road, Mumbai, 400001"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13, right: 18, top: 18),
                              child: ListView(
                                children: [
                                  columnTitleSubTitleWidget("DL Number", "123456HJ-B2"),
                                  columnTitleSubTitleWidget("Address Proof", "Andhar Card"),
                                  columnTitleSubTitleWidget("Photo Identity", "Andhar Card"),
                                  columnTitleSubTitleWidget("Verified", "Yes"),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
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
                  left: 13, right: 18, top: 18, bottom: 15),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ],
    );
  }

  Widget grid3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: DefaultTabController(
            length: 3,
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFededf0)),
                    padding: const EdgeInsets.all(2),
                    child: TabBar(
                      controller: _dashboardMenuController.tabController2,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      labelPadding: const EdgeInsets.all(5),
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                      labelColor: Colors.black,
                      unselectedLabelStyle: const TextStyle(
                          color: Colors.black, fontSize: 13),
                      tabs: const [
                        Text("Total"),
                        Text("Your Institution"),
                        Text("Outside"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.6,
                    child: Expanded(
                      child: TabBarView(
                          controller: _dashboardMenuController.tabController2,
                          children: [
                        ListView(
                          children: [
                            const Center(
                              child: Text("Credit Profile Summary",
                                  style: TextStyle(fontSize: 13)),
                            ),
                            sfRadialGauge(75),
                            Responsive.isMobile(context)
                                ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 13, right: 18, top: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total Lenders", "02")),
                                      Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total CF*(s)", "04")),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total Lenders", "02"),
                                        ),
                                        Expanded(
                                            child: columnTitleSubTitleWidget(
                                                "Total CF*(s)", "04")),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                                          color:
                                          ColourConstants.textDeclinedTitle)),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10, bottom: 30),
                                    child: Text("Total Outstanding",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: ColourConstants
                                                .textDeclinedSubTitle)),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("04",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Open CF",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("02",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Total Lenders",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("04",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Total CF*(s)",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                            Responsive.isMobile(context) ? const Divider() : Container(),
                          ],
                        ),
                        ListView(
                          children: [
                            Center(
                              child: const Text("Credit Profile Summary",
                                  style: TextStyle(fontSize: 13)),
                            ),
                            sfRadialGauge(50),
                            Responsive.isMobile(context)
                                ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 13, right: 18, top: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total Lenders", "02")),
                                      Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total CF*(s)", "04")),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total Lenders", "02"),
                                        ),
                                        Expanded(
                                            child: columnTitleSubTitleWidget(
                                                "Total CF*(s)", "04")),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                                          color:
                                          ColourConstants.textDeclinedTitle)),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10, bottom: 30),
                                    child: Text("Total Outstanding",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: ColourConstants
                                                .textDeclinedSubTitle)),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("04",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Open CF",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("02",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Total Lenders",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("04",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Total CF*(s)",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                            Responsive.isMobile(context) ? const Divider() : Container(),
                          ],
                        ),
                        ListView(
                          children: [
                            Center(
                              child: const Text("Credit Profile Summary",
                                  style: TextStyle(fontSize: 13)),
                            ),
                            sfRadialGauge(90),
                            Responsive.isMobile(context)
                                ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 13, right: 18, top: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total Lenders", "02")),
                                      Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total CF*(s)", "04")),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: columnTitleSubTitleWidget(
                                              "Total Lenders", "02"),
                                        ),
                                        Expanded(
                                            child: columnTitleSubTitleWidget(
                                                "Total CF*(s)", "04")),
                                      ],
                                    ),
                                  )
                                ],
                              ),
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
                                          color:
                                          ColourConstants.textDeclinedTitle)),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10, bottom: 30),
                                    child: Text("Total Outstanding",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: ColourConstants
                                                .textDeclinedSubTitle)),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("04",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Open CF",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("02",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Total Lenders",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                      const VerticalDivider(),
                                      Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 13,
                                              top: 12,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: const [
                                                Text("04",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        color: ColourConstants
                                                            .textDeclinedSubTitle)),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Text("Total CF*(s)",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: ColourConstants
                                                              .textDeclinedSubTitle)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                            Responsive.isMobile(context) ? const Divider() : Container(),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 13, right: 18, top: 18, bottom: 15),
                    child: Column(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("10,34,300",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            ColourConstants.textDeclinedTitle)),
                                Text("Total Outstanding",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: ColourConstants
                                            .textDeclinedSubTitle)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("01",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            ColourConstants.textDeclinedTitle)),
                                Text("Delinquent CF",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: ColourConstants
                                            .textDeclinedSubTitle)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
          padding: const EdgeInsets.only(bottom: 20, top: 5),
          child: Text(subTitle,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildRadialTextPointer() {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
            showAxisLine: false,
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            endAngle: 360,
            minimum: 0,
            maximum: 100,
            radiusFactor: 0.79,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  positionFactor: 0,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '5',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
            pointers: const <GaugePointer>[
              NeedlePointer(
                  needleStartWidth: 1,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleEndWidth: 5,
                  needleLength: 0.5,
                  animationDuration: 2000,
                  value: 50,
                  enableAnimation: true,
                  knobStyle: KnobStyle(knobRadius: 0)),
            ],
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: 0,
                  endValue: 20,
                  startWidth: 0.15,
                  endWidth: 0.15,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: const Color(0xFF4DB218)),
              GaugeRange(
                  startValue: 20,
                  endValue: 40,
                  startWidth: 0.15,
                  endWidth: 0.15,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: const Color(0xFF8FBC3A)),
              GaugeRange(
                  startValue: 40,
                  endValue: 60,
                  startWidth: 0.15,
                  endWidth: 0.15,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: const Color(0xFFD5D056)),
              GaugeRange(
                  startValue: 60,
                  endValue: 80,
                  startWidth: 0.15,
                  endWidth: 0.15,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: const Color(0xFFEDC24F)),
              GaugeRange(
                  startValue: 80,
                  endValue: 100,
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.15,
                  endWidth: 0.15,
                  color: const Color(0xFFFCAF47)),
              GaugeRange(
                  startValue: 100,
                  endValue: 120,
                  startWidth: 0.15,
                  endWidth: 0.15,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: const Color(0xFFF86F46)),
            ]),
      ],
    );
  }

  Widget sfRadialGauge(double value) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            minimum: 0,
            maximum: 100,
            radiusFactor: 0.5,
            axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.05,
                color: ColourConstants.progressShadow),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 180,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${value.toInt()}%",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Text("Utilised",
                          style: TextStyle(
                              fontSize: 13,
                              color: ColourConstants.textDeclinedSubTitle))
                    ],
                  )),
            ],
            pointers: <GaugePointer>[
              RangePointer(
                  value: value,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationDuration: 3000,
                  animationType: AnimationType.ease,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: ColourConstants.progressPercentage,
                  width: 0.15),
            ]),
      ],
    );
  }
}
