import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/chart/bar_chart_3.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';
import 'package:get/get.dart';

class CommercialScreen extends StatelessWidget {
  const CommercialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(title: const Text("Commercial"),backgroundColor: ColourConstants.accent,)
          : PreferredSize(
              child: Container(), preferredSize: const Size(0, 0)),
      body: Column(
        children: [
          Card(
            elevation: 24,
            child: SizedBox(
              height: 350,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 650,
                  width: Get.width,
                  child: const Card(
                    elevation: 24,
                    child: BarChartSample2(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Item - ${index + 1}"),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
