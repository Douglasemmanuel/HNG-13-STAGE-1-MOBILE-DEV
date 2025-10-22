import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_triva_quiz_app/models/quiz_items_models.dart';
import 'package:tech_triva_quiz_app/models/quiz_question_models.dart';
import 'package:tech_triva_quiz_app/models/user_answered_question_models.dart' ;
import 'package:tech_triva_quiz_app/components/progress_bar.dart' ;
import 'package:tech_triva_quiz_app/components/answer_button.dart' ;
import 'package:tech_triva_quiz_app/components/next_button.dart' ;
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;
import 'package:tech_triva_quiz_app/providers/user_answer_provder.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
class ReviewScreen extends ConsumerStatefulWidget{
  const ReviewScreen({super.key});

  @override
  ConsumerState<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  int currentQuestionIndex = 0;
  int totalQuestions  = 10 ;
  // late final List< UserAnsweredQuestion> questions;
  void _nextQuestion() {
    final userAnswers = ref.read(quizAnswersProvider);
    if (currentQuestionIndex < userAnswers.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("🎉 You've reached the end of the review!"),
        ),
      );
      Navigator.of(context, rootNavigator: true)
          .pushNamed(RouteGenerator.result);
    }
  }
  void _previousQuestion() {
  setState(() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
    }
  });
}
  @override
  Widget build(BuildContext context ) {
       final userAnswers = ref.watch(quizAnswersProvider);

    if (userAnswers.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text(
            "No answers yet 🕵️‍♂️",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    final currentAnswer = userAnswers[currentQuestionIndex];
    final currentQuestion = currentAnswer.question;
//   final userAnswers = ref.watch(quizAnswersProvider);
//     final currentQuestion = questions[currentQuestionIndex];
// // Try to find the answer for the current question
//  UserAnsweredQuestion? userAnswer;
// try {
//   userAnswer = userAnswers.firstWhere(
//     (a) => a.question.question == currentQuestion.question,
//   );
// } catch (e) {
//   userAnswer = null;
// }


// final bool answered = userAnswer != null;
// final int? selectedIndex = userAnswer?.selectedOptionIndex;
// final int correctIndex = currentQuestion.question.correctAnswerIndex;

//     if (userAnswers.isEmpty) {
//       return const Center(
//         child: Text(
//           "No answers yet 🕵️‍♂️",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//       );
//     }
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Review',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
       ),
       body: SafeArea(
        child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: SizedBox(
                      width: 250, // Optional: control width
                      child: QuizProgressBar(
                        currentIndex: currentQuestionIndex + 1,
                        totalQuestions: userAnswers.length,
                        progressColor: Colors.blue,
                        height: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Question ${currentQuestionIndex + 1} of ${userAnswers.length}',
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   const SizedBox(height: 20),
                  Text(
                    currentQuestion.question,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
               SizedBox(height: 30),
      ...currentQuestion.options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;

        // 🧠 Get user answers from provider
        // final userAnswers = ref.watch(quizAnswersProvider);

        // Find the user’s answer for this question
        final userAnswer = userAnswers.firstWhere(
          (a) => a.question.question == currentQuestion.question,
          orElse: () => UserAnsweredQuestion(
            question: currentQuestion,
            selectedOptionIndex: -1,
            isCorrect: false,
          ),
        );

        // ✅ Determine if this option is correct or selected by user
         final bool isCorrect = index == currentQuestion.correctAnswerIndex;
          final bool isUserAnswer = index == currentAnswer.selectedOptionIndex;

        return AnswerButton(
          answerText: option,
          isSelected: false, 
          isCorrect: isCorrect,
          isUserAnswer: isUserAnswer,
          onTap: null,
        );
      }),
      
           Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      // 🔙 Previous Question Button
      Expanded(
        child: PrimaryButton(
          text: "Previous Question",
          icon: Icons.arrow_back,
          iconBeforeText: true,
          isEnabled: currentQuestionIndex > 0,
          onPressed: currentQuestionIndex > 0 ? _previousQuestion : null,
        ),
      ),
      const SizedBox(width: 12),

      // 🔜 Next or Finish Button
      Expanded(
        child: PrimaryButton(
          text: currentQuestionIndex == userAnswers.length - 1
              ? "Finish Quiz"
              : "Next Question",
          icon: currentQuestionIndex == userAnswers.length - 1
              ? null
              : Icons.arrow_forward,
          iconBeforeText: false,
          isEnabled: true, // ✅ always enabled now
          onPressed: currentQuestionIndex == userAnswers.length - 1
              ? () {
                  // Navigate to result screen
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(RouteGenerator.result);
                }
              : _nextQuestion,
        ),
      ),
    ],
  ),
)
       
              ],
            ),
          ),

        ),
        )
        ),
    );
  }
}