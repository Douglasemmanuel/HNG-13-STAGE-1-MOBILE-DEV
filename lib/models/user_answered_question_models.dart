import 'package:tech_triva_quiz_app/models/quiz_question_models.dart';

class UserAnsweredQuestion {
  final QuizQuestion question;
  final int selectedOptionIndex;
  final bool isCorrect;

  const UserAnsweredQuestion({
    required this.question,
    required this.selectedOptionIndex,
    required this.isCorrect,
  });

  // ✅ Convenience getters
  String get selectedAnswer => question.options[selectedOptionIndex];
  String get correctAnswer => question.options[question.correctAnswerIndex];

  // ✅ Convert to Map (for saving results or reviewing)
  Map<String, dynamic> toMap() {
    return {
      'question': question.toMap(),
      'selectedOptionIndex': selectedOptionIndex,
      'isCorrect': isCorrect,
    };
  }

  // ✅ Convert from Map
  factory UserAnsweredQuestion.fromMap(Map<String, dynamic> map) {
    return UserAnsweredQuestion(
      question: QuizQuestion.fromMap(map['question']),
      selectedOptionIndex: map['selectedOptionIndex'] ?? 0,
      isCorrect: map['isCorrect'] ?? false,
    );
  }
}
