import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_quiz/utils/assets.dart';
import 'package:football_quiz/view/result_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../models/question.dart';

class QuestionController extends GetxController {
  late String league;
  var questions = [];

  var currentQuestionIndex = 0.obs;
  var correctAnswers = 0.obs;
  var selectedAnswer = ''.obs;
  var isAnswerChecked = false.obs;
  var isLoadingData = true.obs;

  void checkAnswer(String userAnswer) {
    selectedAnswer.value = userAnswer;
    isAnswerChecked.value = true;

    if (questions[currentQuestionIndex.value].correctAnswer.toLowerCase() ==
        userAnswer.toLowerCase()) {
      correctAnswers.value++;
    }

    Future.delayed(const Duration(milliseconds: 1250), nextQuestion);
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = '';
      isAnswerChecked.value = false;
    } else {
      Get.off(() => ResultScreen(league: league));
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    correctAnswers.value = 0;
    selectedAnswer.value = '';
    isAnswerChecked.value = false;
  }

  String getResponseBasedOnScore(int scorePercentage, BuildContext context) {
    if (scorePercentage >= 90) {
      return AppLocalizations.of(context)!.scoreMessageHigh;
    } else if (scorePercentage >= 75) {
      return AppLocalizations.of(context)!.scoreMessageAboveAverage;
    } else if (scorePercentage >= 50) {
      return AppLocalizations.of(context)!.scoreMessageAverage;
    } else if (scorePercentage >= 30) {
      return AppLocalizations.of(context)!.scoreMessageLow;
    } else {
      return AppLocalizations.of(context)!.scoreMessageFail;
    }
  }

  @override
  void onInit() async {
    super.onInit();

    league = Get.arguments;
    String jsonString;
    if (league == 'Premier League') {
      jsonString = await rootBundle.loadString(AppAssets.premierLeagueData);
    } else if (league == 'LaLiga') {
      jsonString = await rootBundle.loadString(AppAssets.laLigaData);
    } else if (league == 'Serie A') {
      jsonString = await rootBundle.loadString(AppAssets.serieAData);
    } else {
      jsonString = await rootBundle.loadString(AppAssets.laLigaData);
    }

    final List<dynamic> jsonData = json.decode(jsonString);

    // Extract all unique team names based on the correctAnswer field.
    // This will be the pool for creating dynamic choices.
    final allTeamNames = jsonData
        .map<String>((item) => item['correctAnswer'].toString())
        .toSet()
        .toList();

    // Create the Question objects using the factory that builds dynamic choices.
    questions = jsonData
        .map((data) =>
            Question.fromMap(data as Map<String, dynamic>, allTeamNames))
        .toList();

    // Optional: Shuffle the question order.
    questions.shuffle();

    // The choices are now generated dynamically in the factory. No need to shuffle again here.
    isLoadingData.value = false;
  }
}
