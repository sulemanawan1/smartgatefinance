import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/splash_controller.dart';

class SplashPage extends GetView {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return const Center(
              child: FlutterLogo(),
            );
          }),
    );
  }
}
