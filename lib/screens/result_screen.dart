import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;
import 'package:tech_triva_quiz_app/providers/user_answer_provder.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  @override
  Widget build(BuildContext context) {
     final userAnswers = ref.read(quizAnswersProvider);
      final int totalQuestions = userAnswers.length;
    final int correctAnswers =
        userAnswers.where((answer) => answer.isCorrect).length;
    final bool isGoodResult = correctAnswers  > (totalQuestions * 0.6);
    final List<Map<String, dynamic>> resultButtons = [
      {
        'title': 'Restart Quiz',
        'icon': Icons.refresh,
        'color': Colors.green,
        'onTap': () {
          // Example: restart quiz
        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
        RouteGenerator.home, 
        (route) => false,     
      );

        },
      },
      {
        'title': 'Show Answers',
        'icon': Icons.menu_book,
        'color': Colors.blueAccent,
        'onTap': () {
           Navigator.of( context , rootNavigator: true).pushNamed(RouteGenerator.review) ;
        },
      },
    ];
       final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz Result' ,
            style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
            ),
          centerTitle: true,
            automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Image.asset(
               isGoodResult ?
              'assets/images/congrats.jpg'
              :
              'assets/images/failed.jpg',

               width: size.width * 0.8,
                    height: size.height * 0.4,
              ),
            SizedBox(height:10) ,
            Text(
                    isGoodResult ? 'Congratulations!' : 'Keep Trying!',
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:10,),
                  Text(
                    isGoodResult
                      ? 'Your result is very good!'
                      : 'Don’t worry, practice makes perfect!',
                    style: GoogleFonts.lato(
                      // color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  _ResultCard(
                correctAnswers: correctAnswers.toString(),
                totalQuestions: totalQuestions.toString(),
              ),
                const SizedBox(height: 20),

                // ✅ Build buttons dynamically
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: resultButtons
                        .map((button) => _ResultActionButton(
                              title: button['title'],
                              icon: button['icon'],
                              color: button['color'],
                              onPressed: button['onTap'],
                            ))
                        .toList(),
                  ),
                ),

                const SizedBox(height: 40),
          ],
        ),
      )
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String correctAnswers;
  final String totalQuestions;

  const _ResultCard({
    required this.correctAnswers,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    // Convert string values to numbers safely
    final double correct = double.tryParse(correctAnswers) ?? 0;
    final double total = double.tryParse(totalQuestions) ?? 1;
    final double percentage = (correct / total * 100).clamp(0, 100);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "$correctAnswers / $totalQuestions",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${percentage.toStringAsFixed(1)}% Correct",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _ResultActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ResultActionButton({
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        width: double.infinity, // full width
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
          ),
        ),
      ),
    );
  }
}