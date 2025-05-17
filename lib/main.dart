import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:football_quiz/core/services/storage_service.dart';
import 'package:football_quiz/utils/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:football_quiz/view/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const FootballQuizApp());
}

class FootballQuizApp extends StatelessWidget {
  const FootballQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    StorageService storageService = Get.put(StorageService());

    return GetMaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: storageService.selectedLang == 0
          ? const Locale('en', '')
          : const Locale('ar', ''),
      debugShowCheckedModeBanner: false,
      theme: AppThemes().lightTheme(),
      home: SplashScreen(),
    );
  }
}
