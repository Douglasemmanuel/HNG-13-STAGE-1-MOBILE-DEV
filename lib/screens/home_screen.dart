import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/models/quiz_items_models.dart' ;
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;
import 'package:tech_triva_quiz_app/data/get_quiz_data.dart' ;


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizList = getQuizList();
    return Scaffold(
      appBar: AppBar(
  centerTitle: true, 
  // automaticallyImplyLeading: false,
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2), // optional border
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/Douglas.jpeg',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  ],
),
 body: SafeArea(
   child: SingleChildScrollView(
             child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'welcome Back',
                    style: TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                    textAlign: TextAlign.left,
                    ),
                    SizedBox(height:5.0),
                    Text(
                    'what do yo want to improve today?',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                     textAlign: TextAlign.left,
                    ),
                     SizedBox(height:10.0),
                    ...quizList.map((quiz) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: _quizcard(context, quiz),
                    )),
                ],
              ),
            ),
        ),
 ),
    );
  }

Widget _quizcard(BuildContext context, QuizItem quiz) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.asset(
            quiz.image,
            width: 100,
            height: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quiz.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  quiz.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),

                // ✅ This Row now spaces evenly between question, time, and button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Question info
                    Row(
                      children: [
                        const Icon(Icons.quiz, size: 16.0),
                        const SizedBox(width: 5),
                        Text(
                          '${quiz.totalQuestions} Questions',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    // Time info
                    Row(
                      children: [
                        const Icon(Icons.timer, size: 16.0),
                        const SizedBox(width: 5),
                        Text(
                          '${quiz.time} Mins',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    // Elevated button
                    ElevatedButton(
                      onPressed: () {
                        print('Navigating to ${quiz.route} with ${quiz.title}');
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          RouteGenerator.quizdetail,
                          arguments: quiz,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Icon(Icons.arrow_right, size: 28),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}

