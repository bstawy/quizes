class QuestionModel {
  final int id;
  final String title;
  final String question;
  final List<String> options;
  final int answerIndex;

  QuestionModel({
    required this.id,
    required this.title,
    required this.question,
    required this.options,
    required this.answerIndex,
  });
}
