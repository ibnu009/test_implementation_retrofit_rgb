import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('CALLING SPLASH');
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const SizedBox(
            width: double.infinity,
          ),
          Image.asset('assets/images/rolling_glory_logo.png'),
          const Spacer(),
          Text(
            controller.test,
            style:
            const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
