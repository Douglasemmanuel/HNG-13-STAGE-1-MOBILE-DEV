import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/models/quiz_question_models.dart';
class QuizItem {
  final String title;
  final String description;
  final String image;
  final String route;
  final int totalQuestions;
  final int time;
  final List<QuizQuestion> questions; // 👈 Added field

  QuizItem({
    required this.title,
    required this.description,
    required this.image,
    required this.route,
    required this.totalQuestions,
    required this.time,
    required this.questions, // 👈 Required in constructor
  });

  // Convert to map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'route': route,
      'totalQuestions': totalQuestions,
      'time': time,
      'questions': questions.map((q) => q.toMap()).toList(),
    };
  }

  // Create QuizItem from a map
  factory QuizItem.fromMap(Map<String, dynamic> map) {
    return QuizItem(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      route: map['route'] ?? '',
      totalQuestions: map['totalQuestions'] ?? 0,
      time: map['time'] ?? 0,
      questions: (map['questions'] as List<dynamic>?)
              ?.map((q) => QuizQuestion.fromMap(q))
              .toList() ??
          [],
    );
  }
}
