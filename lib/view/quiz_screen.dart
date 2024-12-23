import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/utils/constants.dart';
import 'package:football_quiz/utils/tools.dart';
import 'package:get/get.dart';
import '../core/controllers/question_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizScreen extends StatelessWidget {
  final QuestionController questionController = Get.put(QuestionController());

  QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          questionController.league,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Obx(
        () {
          if (questionController.isLoadingData.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                const SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.loading_data),
              ],
            );
          } else if (questionController.questions.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Icon(
                    Icons.error,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppLocalizations.of(context)!.no_data),
              ],
            );
          } else {
            final question = questionController
                .questions[questionController.currentQuestionIndex.value];
            final isAnswerChecked = questionController.isAnswerChecked.value;
            final selectedAnswer = questionController.selectedAnswer.value;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.question} ${questionController.currentQuestionIndex.value + 1}/${questionController.questions.length}',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${((questionController.currentQuestionIndex.value) / questionController.questions.length * 100).toInt()}%',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Obx(
                        () => Container(
                          height: 10,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: appPrimaryColor.withValues(alpha: 0.15),
                          ),
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(
                                begin: 0,
                                end: questionController
                                        .currentQuestionIndex.value /
                                    questionController.questions.length),
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.ease,
                            builder: (context, value, child) {
                              return Container(
                                width: value *
                                    (MediaQuery.of(context).size.width - 32),
                                decoration: BoxDecoration(
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Center(
                        child: CachedNetworkImage(
                          placeholder: (_, __) => Image.network(
                            question.thumbnailImage,
                            scale: 0.5,
                          ),
                          imageUrl: question.flagImage,
                          errorWidget: (context, error, stackTrace) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                              Text(error.toString()),
                            ],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      AppLocalizations.of(context)!.question_title,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: question.choices.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final choice = question.choices[index];
                        final isCorrect = choice == question.correctAnswer;
                        final isSelected = choice == selectedAnswer;

                        Color backgroundColor = const Color(0xffe7edee);
                        if (isAnswerChecked) {
                          if (isCorrect) {
                            backgroundColor = Colors.greenAccent;
                          } else if (isSelected) {
                            backgroundColor = Colors.redAccent;
                          }
                        }

                        return GestureDetector(
                          onTap: isAnswerChecked
                              ? null
                              : () {
                                  questionController.checkAnswer(choice);
                                },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(5, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                AppTools().getClubByString(context, choice),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
