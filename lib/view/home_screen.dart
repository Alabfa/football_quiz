import 'dart:io';

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/core/controllers/home_screen_controller.dart';
import 'package:football_quiz/utils/assets.dart';
import 'package:football_quiz/view/quiz_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Football Quiz'),
        leading: IconButton(
          onPressed: homeScreenController.onChangeLangPressed,
          icon: const Icon(Icons.language),
          tooltip: 'Change language',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                children: [
                  Bounce(
                    onTap: () => Get.to(
                      () => QuizScreen(),
                      arguments: 'Premier League',
                    ),
                    child: buildCard(
                      context,
                      AppAssets.premierLeagueLogo,
                      'Premier League',
                      const Color(0xff3d195b),
                    ),
                  ),
                  Bounce(
                    onTap: () => Get.to(
                      () => QuizScreen(),
                      arguments: 'LaLiga',
                    ),
                    child: buildCard(
                      context,
                      AppAssets.laLigaLogo,
                      'LaLiga',
                      const Color(0xffff4b44),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${AppLocalizations.of(context)!.developed_by}: '),
                InkWell(
                  onTap: homeScreenController.onDevNamePressed,
                  child: const Text(
                    '@Alabfa',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            if (Platform.isAndroid) const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    String imgPath,
    String title,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffe7edee),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color, width: 0.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            color: color.withValues(alpha: 0.4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Expanded(
            child: Image.asset(
              imgPath,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: color,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
