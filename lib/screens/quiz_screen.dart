import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/models/quiz_items_models.dart' ;
import 'package:google_fonts/google_fonts.dart';
// import 'package:tech_triva_quiz_app/data/get_quiz_data.dart';

class QuizScreen extends StatefulWidget {
  final QuizItem quiz ;
  const QuizScreen({super.key , required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Text(
          widget.quiz.title ,
          )
      ),
      body: SingleChildScrollView(
        child: Center(
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
              textAlign: TextAlign.center,
              widget.quiz.questions.first.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ],
          ),
      ),
    ),
      ),
    );
  }
}