import 'package:flutter/material.dart';
import 'package:football_quiz/utils/constants.dart';
import 'package:football_quiz/view/home_screen.dart';
import 'package:football_quiz/view/quiz_screen.dart';
import 'package:get/get.dart';
import '../core/controllers/question_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultScreen extends StatelessWidget {
  final String league;
  final QuestionController questionController = Get.find();

  ResultScreen({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    final scorePercentage = (questionController.correctAnswers.value /
            questionController.questions.length) *
        100;
    final isPass = scorePercentage >= 50;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.result_title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isPass
                      ? [const Color(0xFF00C006), const Color(0xFF007B06)]
                      : [const Color(0xFFEA3700), const Color(0xFF8F2201)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  isPass ? Icons.emoji_events : Icons.close,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              questionController.getResponseBasedOnScore(
                scorePercentage.toInt(),
                context,
              ),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.result_score(
                questionController.correctAnswers.value,
                questionController.questions.length,
              ),
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isPass
                    ? Colors.greenAccent.withValues(alpha: 0.1)
                    : Colors.redAccent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.score,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isPass ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${scorePercentage.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isPass ? Colors.green : Colors.red,
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  questionController.resetQuiz();
                  Get.off(() => QuizScreen(), arguments: league);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: appPrimaryColor,
                ),
                child: Text(
                  AppLocalizations.of(context)!.retry_quiz,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Get.off(() => HomeScreen());
              },
              child: Text(
                AppLocalizations.of(context)!.exit_to_home,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
