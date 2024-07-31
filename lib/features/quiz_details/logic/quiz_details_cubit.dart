import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/question_model.dart';
import '../../models/quiz_model.dart';

part 'quiz_details_state.dart';

class QuizDetailsCubit extends Cubit<QuizDetailsState> {
  QuizModel? quiz;
  List<QuestionModel>? questions;
  bool timesUp = false;
  int answeredQuestions = 0;
  int correctAnswers = 0;

  QuizDetailsCubit() : super(QuizDetailsInitial());

  void setQuiz(QuizModel quiz) {
    this.quiz = quiz;
    questions = quiz.questions;
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
      quiz!.score = correctAnswers;
      quiz!.isCompleted = true;
      emit(QuizDetailsFinishedAllQuestions());
    }
  }
}
