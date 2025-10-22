
import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/screens/home_screen.dart';
import 'package:tech_triva_quiz_app/screens/review_screen.dart';
import 'package:tech_triva_quiz_app/screens/result_screen.dart';
import 'package:tech_triva_quiz_app/screens/start_screen.dart' ;
import 'package:tech_triva_quiz_app/screens/quiz_screen.dart' ;
import 'package:tech_triva_quiz_app/models/quiz_items_models.dart';


class RouteGenerator {
  static const String initial = '/';
  static const String home = '/home';
  static const String result = '/result';
  static const String quizdetail = '/quiz-detail';
  static const String review = '/review';
 


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case result:
        final quiz = settings.arguments as QuizItem;
        return MaterialPageRoute(builder: (_) => ResultScreen(quiz: quiz));
      case review:
          return MaterialPageRoute(builder:(_)=> ReviewScreen());
      case quizdetail:
          final quiz = settings.arguments as QuizItem;
        return MaterialPageRoute(builder: (_) => QuizScreen(quiz: quiz));
       

      default:
        return _errorRoute();
    }
  }

  // This method is outside the generateRoute method — at class level!
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}