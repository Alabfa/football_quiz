import 'dart:convert';

class Question {
  final String flagImage;
  final String thumbnailImage;
  final List<String> choices;
  final String correctAnswer;

  Question({
    required this.flagImage,
    required this.thumbnailImage,
    required this.choices,
    required this.correctAnswer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'flagImage': flagImage,
      'thumbnailImage': thumbnailImage,
      'choices': choices,
      'correctAnswer': correctAnswer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      flagImage: map['flagImage'] as String,
      thumbnailImage: map['thumbnailImage'] as String,
      choices: List<String>.from(map['choices'] as List<dynamic>),
      correctAnswer: map['correctAnswer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
