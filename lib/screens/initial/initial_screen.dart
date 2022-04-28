import 'package:flutter/material.dart';
import 'package:flutter_poc/screens/initial/initial_controller.dart';

class InitialScreen extends StatelessWidget {
  InitialScreen({Key? key}) : super(key: key);

  final _controller = InitialController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _controller.pressMe();
          },
          child: const Text('Press Me!'),
        ),
      ),
    );
  }
}
