import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_poc/screens/enquiry_information/ui/enquiry_information_page.dart';
import 'package:flutter_poc/screens/initial/initial_screen.dart';
import 'package:flutter_poc/utils/constants.dart';
import 'package:flutter_poc/utils/ui/scroll_behaviours.dart';
import 'package:get/get.dart';
import 'dart:js' as js;
///Main entry point this app
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ///Set the orientation for Portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  ///Setting up theme and initial widget here
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
          primaryColor: ColourConstants.primary,
          accentColor: ColourConstants.accent),
      home: EnquiryInformation(),),
  );

}
extension ColorString on Color {
  String toHexString() {
    return '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }
}

void setMetaThemeColor(Color color) {
  js.context.callMethod("setMetaThemeColor", [color.toHexString()]);
}
/// Initial widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter POC'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => InitialScreen());
          },
          child: const Text('Go to initial widget'),
        ),
      ),
    );
  }


}
