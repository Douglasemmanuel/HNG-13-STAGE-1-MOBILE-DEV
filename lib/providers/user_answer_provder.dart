import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:tech_triva_quiz_app/models/quiz_question_models.dart' ;
import 'package:tech_triva_quiz_app/models/user_answered_question_models.dart' ;


class QuizAnswersNotifier extends StateNotifier<List<UserAnsweredQuestion>>{
  QuizAnswersNotifier() : super([]);

  void addAnswer(QuizQuestion question , int selectedIndex){
    final isCorrect = selectedIndex == question.correctAnswerIndex;
    final answer = UserAnsweredQuestion(
      question: question, 
      selectedOptionIndex: selectedIndex,
      isCorrect: isCorrect
       );
    final existingIndex =
        state.indexWhere((a) => a.question.question == question.question);
    if (existingIndex != -1) {
      final updated = [...state];
      updated[existingIndex] = answer;
      state = updated;
    } else {
      state = [...state, answer];
    }
  }

   void reset() => state = [];

  int get correctCount => state.where((a) => a.isCorrect).length;
  int get totalAnswered => state.length;
  
}

final quizAnswersProvider =
    StateNotifierProvider<QuizAnswersNotifier, List<UserAnsweredQuestion>>(
  (ref) => QuizAnswersNotifier(),
);