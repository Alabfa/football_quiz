import 'package:flutter/material.dart';
import 'package:football_quiz/core/controllers/splash_screen_controller.dart';
import 'package:football_quiz/utils/assets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashScreenController splashScreenController =
      Get.put(SplashScreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    AppAssets.appIcon,
                    height: 180,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Football Quiz',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
