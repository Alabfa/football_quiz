import 'package:flutter/material.dart';
import 'package:football_quiz/core/controllers/lang_controller.dart';
import 'package:football_quiz/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ChangeLangScreen extends StatelessWidget {
  final LangController langController = Get.put(LangController());
  ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor:
                      const Color(0xffe7edee).withValues(alpha: 0.5),
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffe7edee),
                    child: Center(
                      child: Icon(
                        Icons.language_rounded,
                        size: 80,
                        color: appPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease,
                alignment: Get.locale!.languageCode == 'ar'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.language_title,
                  key: ValueKey(Get.locale!.languageCode),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease,
                alignment: Get.locale!.languageCode == 'ar'
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.language_subtitle,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              buildLanguageBtn(0),
              const SizedBox(height: 10),
              buildLanguageBtn(1),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: langController.onDonePressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: appPrimaryColor,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Text(
                      AppLocalizations.of(context)!.done,
                      key: ValueKey(Get.locale!.languageCode),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLanguageBtn(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () => langController.changeLanguage(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: langController.selectedLangIndex.value == index
                ? const Color(0xffe7edee)
                : const Color(0xFFeeeeee),
            boxShadow: [
              BoxShadow(
                offset: const Offset(5, 5),
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                spreadRadius: 0.15,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: langController.selectedLangIndex.value == index
                ? Border.all(color: appPrimaryColor, width: 1.2)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                index == 0 ? 'English' : 'العربية',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 26,
                  color: langController.selectedLangIndex.value == index
                      ? appPrimaryColor
                      : null,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: langController.selectedLangIndex.value == index
                      ? Text(
                          langController.generateFact(index),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          maxLines: 1,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
