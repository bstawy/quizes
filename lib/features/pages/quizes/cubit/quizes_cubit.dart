import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/question_model.dart';
import '../../../models/quiz_model.dart';

part 'quizes_state.dart';

class QuizesCubit extends Cubit<QuizesState> {
  QuizesCubit() : super(QuizesInitial());

  void fetchQuizes() {
    emit(QuizesLoading());
    final List<QuizModel> quizes = [
      QuizModel(
        id: 1,
        title: 'أختبار المعرفة العامة',
        description: 'غطي مجموعة متنوعة من الأسئلة في مجالات متعددة',
        totalQuestions: '3',
        score: 10,
        duration: const Duration(minutes: 30),
        questions: [
          QuestionModel(
            id: 1,
            title: "السؤال الأول",
            question: "ما هو عاصمة السعودية؟",
            options: ['أ) الرياض', 'ب) جدة', 'ج) مكة', 'د) المدينة المنورة'],
            answerIndex: 0,
          ),
          QuestionModel(
            id: 2,
            title: "السؤال الثاني",
            question: "ما هو عاصمة مصر؟",
            options: ['أ) الإسكندرية', 'ب) القاهرة', 'ج) الجيزة', 'د) الأقصر'],
            answerIndex: 1,
          ),
          QuestionModel(
            id: 3,
            title: "السؤال الثالث",
            question: "ما هو عاصمة الأردن؟",
            options: ['أ) الزرقاء', 'ب) إربد', 'ج) عمان', 'د) العقبة'],
            answerIndex: 2,
          ),
        ],
        isCompleted: true,
      ),
      QuizModel(
        id: 2,
        title: 'إختبار مادة الرياضيات الأساسية',
        description: 'أسئلة متنوعة فى الرياضيات',
        totalQuestions: '10',
        score: 0,
        duration: const Duration(minutes: 10),
        questions: [
          QuestionModel(
            id: 4,
            title: "السؤال الأول",
            question: "ما هو ناتج 12 * 7؟",
            options: ['أ) 72', 'ب) 84', 'ج) 96', 'د) 108'],
            answerIndex: 1,
          ),
          QuestionModel(
            id: 5,
            title: "السؤال الثاني",
            question: "ما هو ناتج 15 * 6؟",
            options: ['أ) 90', 'ب) 100', 'ج) 110', 'د) 120'],
            answerIndex: 0,
          ),
          QuestionModel(
            id: 6,
            title: "السؤال الثالث",
            question: "ما هو ناتج 18 * 5؟",
            options: ['أ) 90', 'ب) 100', 'ج) 110', 'د) 120'],
            answerIndex: 3,
          ),
          QuestionModel(
            id: 7,
            title: "السؤال الرابع",
            question: "ما هو ناتج 12 * 7؟",
            options: ['أ) 72', 'ب) 84', 'ج) 96', 'د) 108'],
            answerIndex: 1,
          ),
          QuestionModel(
            id: 8,
            title: "السؤال الخامس",
            question: "ما هو ناتج 15 * 6؟",
            options: ['أ) 90', 'ب) 100', 'ج) 110', 'د) 120'],
            answerIndex: 0,
          ),
          QuestionModel(
            id: 9,
            title: "السؤال السادس",
            question: "ما هو ناتج 18 * 5؟",
            options: ['أ) 90', 'ب) 100', 'ج) 110', 'د) 120'],
            answerIndex: 3,
          ),
          QuestionModel(
            id: 10,
            title: "السؤال السابع",
            question: "ما هو ناتج 18 * 5؟",
            options: ['أ) 90', 'ب) 100', 'ج) 110', 'د) 120'],
            answerIndex: 3,
          ),
          QuestionModel(
            id: 11,
            title: "السؤال الثامن",
            question: "ما هو ناتج 12 * 7؟",
            options: ['أ) 72', 'ب) 84', 'ج) 96', 'د) 108'],
            answerIndex: 1,
          ),
          QuestionModel(
            id: 12,
            title: "السؤال التاسع",
            question: "ما هو ناتج 15 * 6؟",
            options: ['أ) 90', 'ب) 100', 'ج) 110', 'د) 120'],
            answerIndex: 0,
          ),
          QuestionModel(
            id: 13,
            title: "السؤال العاشر",
            question: "ما هو ناتج 18 * 5؟",
            options: ['أ) 90', 'ب) 100', 'ج) 110', 'د) 120'],
            answerIndex: 3,
          ),
        ],
      ),
    ];
    emit(QuizesLoaded(quizes));
  }
}
