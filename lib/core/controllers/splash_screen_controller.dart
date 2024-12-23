import 'dart:async';

import 'package:football_quiz/core/services/storage_service.dart';
import 'package:football_quiz/view/change_lang_screen.dart';
import 'package:football_quiz/view/home_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  StorageService storageService = Get.find();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      if (storageService.isFristOpen) {
        Get.off(() => ChangeLangScreen());
      } else {
        Get.off(() => HomeScreen());
      }
    });
  }
}
