import 'package:flutter/widgets.dart';
import 'package:flutter_poc/screens/splash_screen/controller/splash_screen_controller.dart';
import 'package:flutter_poc/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController = SplashScreenController();

  @override
  void initState() {
    super.initState();
    splashScreenController.navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColourConstants.primary,
      alignment: Alignment.center,
      child: Image.asset("images/logo_icon.png"),
    );
  }
}
