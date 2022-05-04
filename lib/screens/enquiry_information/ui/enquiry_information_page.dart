import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/enquiry_information/controller/enquiry_information_controller.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/image_slider/simple_slider.dart';
import 'package:flutter_poc/utils/ui/responsive.dart';

class EnquiryInformation extends StatelessWidget {
  EnquiryInformation({Key? key}) : super(key: key);

  final enquiryController = EnquiryInfoController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Center(child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("images/logo_name_blue.png"),
              ))),
          Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: ImageSliderWidget(
                  imageUrls: enquiryController.slideImages,
                  imageHeight: size.height / 3.5,
                ),
              )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: (Responsive.isDesktop(context) ||
                          Responsive.isTablet(context))
                      ? size.width / 3
                      : double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        Constants.enquiryInfoStr,
                        style: TextStyle(
                            color: ColourConstants.textColour,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height / 40),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            hintStyle: const TextStyle(
                                color: ColourConstants.textFieldHint),
                            hintText: Constants.enquiryInfoHint,
                            fillColor: ColourConstants.textFieldBG),
                      ),
                      SizedBox(height: size.height / 40),
                      SizedBox(
                        width: double.maxFinite,
                        height: size.height / 18,
                        child: ElevatedButton(
                            onPressed: () {
                              enquiryController.navigateToDashboard();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: ColourConstants.accent,
                            ),
                            child: const Text(
                              'Search',
                              style: TextStyle(color: Colors.black),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
