class QuestionModel {
  final int id;
  final String title;
  final String question;
  final List<String> options;
  final int answerIndex;
  int? userAnswerIndex;
  bool? isCorrect;

  QuestionModel({
    required this.id,
    required this.title,
    required this.question,
    required this.options,
    required this.answerIndex,
    this.userAnswerIndex,
    this.isCorrect,
  });

  // Add a clone method
  QuestionModel clone() {
    return QuestionModel(
      id: id,
      title: title,
      question: question,
      options: List.from(options),
      answerIndex: answerIndex,
      userAnswerIndex: userAnswerIndex,
      isCorrect: isCorrect,
    );
  }
}
