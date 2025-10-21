import 'dart:math';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  // ✅ Add this to convert to Map
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }

  // ✅ Add this to convert from Map
  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      question: map['question'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      correctAnswerIndex: map['correctAnswerIndex'] ?? 0,
    );
  }

  // ✅ Optional: Helper
  String get correctAnswer => options[correctAnswerIndex];

  //TO SHUFFLE THE QUESTIONS AND ANSWERS FOR DIFFERENT ATTEMPTS
  QuizQuestion shuffled() {
    final random = Random();
    final shuffledOptions = List<String>.from(options)..shuffle(random);
    final newCorrectIndex =
        shuffledOptions.indexOf(options[correctAnswerIndex]);

    return QuizQuestion(
      question: question,
      options: shuffledOptions,
      correctAnswerIndex: newCorrectIndex,
    );
  }
}

