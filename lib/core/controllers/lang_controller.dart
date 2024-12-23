import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_quiz/core/services/storage_service.dart';
import 'package:football_quiz/view/home_screen.dart';
import 'package:get/get.dart';

class LangController extends GetxController {
  StorageService storageService = Get.find();
  late RxInt selectedLangIndex;

  String generateFact(int index) {
    List<String> enFacts = [
      "Real Madrid is the best club in the world",
      "Ref blew the whistle, Jude said, 'FUCK YOU!'",
      "The ball went so high, it joined the birds!",
      "Watching Barca defend is like a comedy show!",
      "VAR: because who doesn’t love a good plot twist?",
    ];

    List<String> arFacts = [
      "اعتبر اكو شي مكتوب هنا",
      "ميسي، لاعب يعرف كيف يكتب تاريخ كرة القدم بحركاته!",
      "شوتة رونالدو، قوة ودقة تخلي الجول يسكت!",
      "توتنهام يلعبون كأن الفوز مو ضمن أهدافهم!",
      "الـVAR شغله الوحيد: يخليك تحتفل وبعدين تندم!"
    ];

    int randomNum = Random().nextInt(4);

    if (index == 0) {
      return enFacts[randomNum];
    } else {
      return arFacts[randomNum];
    }
  }

  void changeLanguage(int newIndex) async {
    selectedLangIndex.value = newIndex;
    if (newIndex == 0) {
      Get.updateLocale(const Locale('en', ''));
    } else if (newIndex == 1) {
      Get.updateLocale(const Locale('ar', ''));
    }

    await storageService.updateSelectedLang(newIndex);
  }

  onDonePressed() async {
    if (storageService.isFristOpen) {
      await storageService.updateIsFristOpen(false);
      Get.off(() => HomeScreen());
    } else {
      Get.back();
    }
  }

  @override
  void onInit() {
    super.onInit();
    selectedLangIndex = storageService.selectedLang.obs;
  }
}
