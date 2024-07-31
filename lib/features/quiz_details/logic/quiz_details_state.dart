part of 'quiz_details_cubit.dart';

@immutable
sealed class QuizDetailsState {}

final class QuizDetailsInitial extends QuizDetailsState {}

final class QuizDetailsLoaded extends QuizDetailsState {}

final class QuizDetailsTimesUp extends QuizDetailsState {}

final class QuizDetailsAnsweredQuestions extends QuizDetailsState {}

final class QuizDetailsFinishedAllQuestions extends QuizDetailsState {}
