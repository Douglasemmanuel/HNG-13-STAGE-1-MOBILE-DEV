import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_triva_quiz_app/models/quiz_items_models.dart';
import 'package:tech_triva_quiz_app/models/quiz_question_models.dart';
import 'package:tech_triva_quiz_app/components/progress_bar.dart' ;
import 'package:tech_triva_quiz_app/components/answer_button.dart' ;
import 'package:tech_triva_quiz_app/components/next_button.dart' ;
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;
import 'package:tech_triva_quiz_app/providers/user_answer_provder.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_triva_quiz_app/components/question_timmer.dart' ;
class QuizScreen extends ConsumerStatefulWidget {
  final QuizItem quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int currentQuestionIndex = 0;
  late final List<QuizQuestion> questions;
   String? selectedAnswer;
 // Store selected answers per question index
  Map<int, String> selectedAnswers = {};

  final GlobalKey _timerKey = GlobalKey();

  void _finishQuiz() {
    // 🛑 Stop timer before navigating
    (_timerKey.currentState as dynamic)?.stopTimer();
      print('Hello');
      Navigator.of(context, rootNavigator: true).pushNamed(
      RouteGenerator.result,
      arguments: widget.quiz,
    );
   
  }

/// Safely restart the QuizTimer by calling its exposed restart method if available,
/// or falling back to stop/start if restart isn't present.
void _restartTimer() {
  final timerState = _timerKey.currentState;
  if (timerState == null) return;

  // Prefer a direct restart if the timer exposes it.
  try {
    (timerState as dynamic)?.restartTimer();
  } catch (_) {
    // Fallback: try stop/start if restart isn't available.
    try {
      (timerState as dynamic)?.stopTimer();
    } catch (_) {}
    try {
      (timerState as dynamic)?.startTimer();
    } catch (_) {}
  }
}

void _handleTimeout() {
  if (currentQuestionIndex < questions.length - 1) {
    setState(() {
      currentQuestionIndex++;
    });

    // Restart the timer for the next question via the helper.
    _restartTimer();
  } else {
    _finishQuiz();
  }
}
   


  @override
  void initState() {
    super.initState();
    // ✅ Initialize questions safely
   questions = widget.quiz.questions
      .map((q) => q.shuffled()) // Shuffle the options in each question
      .toList()
    ..shuffle();
  }

  void _nextQuestion() {
  final hasAnswered = selectedAnswer != null;

  if (currentQuestionIndex < questions.length - 1) {
    setState(() {
      currentQuestionIndex++;
      selectedAnswer = null;
    });

    if (!hasAnswered) {
      _restartTimer() ;
    }
  } else {
    _finishQuiz();
    
  }
}

  void _previousQuestion() {
  setState(() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
      selectedAnswer = null;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
     final selectedAnswer = selectedAnswers[currentQuestionIndex];
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Go Back',
        onPressed: () {
          // 🧹 Reset quiz answers when user goes back
          ref.read(quizAnswersProvider.notifier).reset();

          // 🔙 Navigate back
          Navigator.of(context).pop();
        },
      ),
        title: Text(
          widget.quiz.title ,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          ),
    actions: [
    Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: QuizTimer(
        key: _timerKey,
        totalSeconds: 60,
        onTimeUp: () {
          
          // 🚨 When timer finishes
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text("⏰ Time’s up!")),
          // );
              Future.delayed(const Duration(seconds: 1), () {
          _handleTimeout(); // ✅ Now only call this — it handles navigation
        });
        },
      ),
    ),
  ],
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
                        currentIndex: currentQuestionIndex,
                        totalQuestions: widget.quiz.totalQuestions,
                        progressColor: Colors.blue,
                        height: 12,
                      ),
                    ),
                  ),
        
                  const SizedBox(height: 20.0),
                  Text(
                    'Question ${currentQuestionIndex + 1} of ${widget.quiz.totalQuestions}',
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
                      // color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

             
                          SizedBox(height: 30),
            ...currentQuestion.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isSelected = selectedAnswer == option;

              return AnswerButton(
                answerText: option,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    selectedAnswers[currentQuestionIndex] = option;
                  });

                  // ✅ Update provider
                  ref
                      .read(quizAnswersProvider.notifier)
                      .addAnswer(currentQuestion, index);
                },
              );
            }),

           Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
     mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
    children: [
      // Previous Question Button (arrow before text)
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
      // Next / Finish Button (arrow after text)
      Expanded(
        child: PrimaryButton(
          text: currentQuestionIndex == questions.length - 1
              ? "Finish Quiz"
              : "Next Question",
          icon: currentQuestionIndex == questions.length - 1
              ? null
              : Icons.arrow_forward,
          iconBeforeText: false,
          isEnabled: selectedAnswer != null,
          onPressed: selectedAnswer != null ? _nextQuestion : null,
        ),
      ),
    ],
  ),
)


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
