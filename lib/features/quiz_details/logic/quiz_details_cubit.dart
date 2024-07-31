import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/question_model.dart';

part 'quiz_details_state.dart';

class QuizDetailsCubit extends Cubit<QuizDetailsState> {
  List<QuestionModel>? questions;
  bool timesUp = false;
  bool quizFinished = false;
  int answeredQuestions = 0;
  int correctAnswers = 0;

  QuizDetailsCubit() : super(QuizDetailsInitial());

  void setQuestions(List<QuestionModel> questions) {
    this.questions = questions;
    emit(QuizDetailsLoaded());
  }

  void setTimesUp() {
    timesUp = true;
    emit(QuizDetailsTimesUp());
  }

  void setAnsweredQuestions() {
    answeredQuestions = questions!
        .where((element) => element.userAnswerIndex != null)
        .toList()
        .length;

    emit(QuizDetailsAnsweredQuestions());
  }

  void checkAnswer(int questionId, int userAnswerIndex) {
    QuestionModel question =
        questions!.firstWhere((element) => element.id == questionId);

    if (question.answerIndex == userAnswerIndex) {
      question.isCorrect = true;
      question.userAnswerIndex = userAnswerIndex;
      correctAnswers++;
    } else {
      question.isCorrect = false;
      question.userAnswerIndex = userAnswerIndex;
    }
    setAnsweredQuestions();
    finishAllQuestions();
  }

  void clearAnswer(int questionId) {
    QuestionModel question =
        questions!.firstWhere((element) => element.id == questionId);

    question.isCorrect = null;
    question.userAnswerIndex = null;
    setAnsweredQuestions();
  }

  void finishAllQuestions() {
    if (answeredQuestions == questions!.length) {
      quizFinished = true;
      emit(QuizDetailsFinishedAllQuestions());
    }
  }
}
