class Question {
  final String flagImage;
  final String thumbnailImage;
  final String correctAnswer;
  final List<String> choices;

  Question({
    required this.flagImage,
    required this.thumbnailImage,
    required this.correctAnswer,
    required this.choices,
  });

  factory Question.fromMap(
      Map<String, dynamic> map, List<String> allTeamNames) {
    String correct = map['correctAnswer'];

    // Filter out the correct answer
    List<String> incorrectChoices = List.from(allTeamNames)..remove(correct);

    // Shuffle and pick 3 random wrong choices
    incorrectChoices.shuffle();
    List<String> selectedChoices = incorrectChoices.take(3).toList();

    // Add the correct one
    selectedChoices.add(correct);

    // Shuffle again to randomize position of the correct answer
    selectedChoices.shuffle();

    return Question(
      flagImage: map['flagImage'],
      thumbnailImage: map['thumbnailImage'],
      correctAnswer: correct,
      choices: selectedChoices,
    );
  }
}
