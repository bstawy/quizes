part of 'quizes_cubit.dart';

@immutable
sealed class QuizesState {}

final class QuizesInitial extends QuizesState {}

final class QuizesLoading extends QuizesState {}

final class QuizesLoaded extends QuizesState {
  final List<QuizModel> quizes;

  QuizesLoaded(this.quizes);
}
