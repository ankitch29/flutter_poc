import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/enquiry_information/controller/enquiry_information_controller.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/image_slider/simple_slider.dart';

class EnquiryInformation extends StatelessWidget {
  EnquiryInformation({Key? key}) : super(key: key);

  final enquiryController = EnquiryInfoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Center(child: Image.asset("images/logo_name_blue.png")),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: ImageSliderWidget(
                    imageUrls: enquiryController.slideImages,
                    imageBorderRadius: BorderRadius.circular(8.0),
                    imageHeight: MediaQuery.of(context).size.height/3.5,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Constants.enquiryInfoStr,
                    style: TextStyle(
                        color: ColourConstants.textColour,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
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
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.maxFinite,
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          primary: ColourConstants.accent,
                        ),
                        child: const Text('Search',style: TextStyle(color: Colors.black),)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
