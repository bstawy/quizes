import 'question_model.dart';

class QuizModel {
  final int id;
  final String title;
  final String description;
  final int totalQuestions;
  int score;
  final Duration duration;
  final List<QuestionModel> questions;
  final bool isCompleted;

  QuizModel({
    required this.id,
    required this.title,
    required this.description,
    required this.totalQuestions,
    required this.score,
    required this.duration,
    required this.questions,
    this.isCompleted = false,
  });

  QuizModel copyWith({
    int? id,
    String? title,
    String? description,
    int? totalQuestions,
    int? score,
    Duration? duration,
    List<QuestionModel>? questions,
    bool? isCompleted,
  }) {
    return QuizModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      score: score ?? this.score,
      duration: duration ?? this.duration,
      questions: questions ?? this.questions,
    );
  }
}
