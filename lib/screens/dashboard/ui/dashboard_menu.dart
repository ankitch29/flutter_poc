import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/dashboard/controller/dashboard_menu_controller.dart';
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

class _DashboardMenuState extends State<DashboardMenu> {
  final _dashboardMenuController = Get.put(DashboardMenuController());

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
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 18, top: 18),
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
          child: Card(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13, right: 18, top: 18),
                  child: Column(
                    children: [
                      const Text("Credit Profile Summary",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13)),
                      sfRadialGauge()
                    ],
                  ),
                ),
                Responsive.isMobile(context)
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 13, right: 18, top: 18),
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
                                    color: ColourConstants.textDeclinedTitle)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            maximum: 120,
            radiusFactor: 0.79,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  angle: 180,
                  widget: Column(
                    children: const [
                      Text(
                        '7',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
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
                  value: 73,
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

  Widget sfRadialGauge() {
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
                    children: const [
                      Text(
                        '75%',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("Utilised",
                          style: TextStyle(
                              fontSize: 13, color: ColourConstants.textDeclinedSubTitle))
                    ],
                  )),
            ],
            pointers: const <GaugePointer>[
              RangePointer(
                  value: 75,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationDuration: 1200,
                  animationType: AnimationType.ease,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: ColourConstants.progressPercentage,
                  width: 0.15),
            ]),
      ],
    );
  }

}
