import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_triva_quiz_app/models/quiz_items_models.dart';
import 'package:tech_triva_quiz_app/models/quiz_question_models.dart';
import 'package:tech_triva_quiz_app/components/progress_bar.dart' ;
import 'package:tech_triva_quiz_app/components/answer_button.dart' ;
import 'package:tech_triva_quiz_app/components/next_button.dart' ;
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;
class QuizScreen extends StatefulWidget {
  final QuizItem quiz;

  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  late final List<QuizQuestion> questions;
   String? selectedAnswer;
 // Store selected answers per question index
  Map<int, String> selectedAnswers = {};

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
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("🎉 You've reached the end of the quiz!"),
        ),
      );
       Navigator.of( context , rootNavigator: true).pushNamed(RouteGenerator.result) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
     final selectedAnswer = selectedAnswers[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.quiz.title ,
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
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:30),
               ...currentQuestion.options.map((option) {
                    final isSelected = selectedAnswer == option;
                    return AnswerButton(
                      answerText: option,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                           selectedAnswers[currentQuestionIndex] = option;
                        });
                      },
                    );
                  }),
                  Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimaryButton(
                  text: currentQuestionIndex == questions.length - 1
                      ? "Finish Quiz"
                      : "Next Question",
                  isEnabled: selectedAnswer != null,
                  onPressed: selectedAnswer != null ? _nextQuestion : null,
                ),
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
