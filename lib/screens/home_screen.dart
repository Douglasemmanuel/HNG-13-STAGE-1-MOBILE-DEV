// import 'package:flutter/material.dart';
// import 'package:tech_triva_quiz_app/models/quiz_items_models.dart' ;
// import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;
// import 'package:tech_triva_quiz_app/data/get_quiz_data.dart' ;


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final quizList = getQuizList();
//     final colorScheme = Theme.of(context).colorScheme; // ✅ use theme colors
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       appBar: AppBar(
//   centerTitle: true, 
//   // automaticallyImplyLeading: false,
//   actions: [
//     Padding(
//       padding: const EdgeInsets.only(right: 12.0),
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color: Colors.white, width: 2), // optional border
//         ),
//         child: ClipOval(
//           child: Image.asset(
//             'assets/images/Douglas.jpeg',
//             width: 50,
//             height: 50,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
//  body: SafeArea(
//    child: SingleChildScrollView(
//              child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'welcome Back',
//                     style: TextStyle(
//                       fontSize: 38.0,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2.0,
//                     ),
//                     textAlign: TextAlign.left,
//                     ),
//                     SizedBox(height:5.0),
//                     Text(
//                     'what do yo want to improve today?',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                      textAlign: TextAlign.left,
//                     ),
//                      SizedBox(height:10.0),
//                     ...quizList.map((quiz) => Padding(
//                       padding: const EdgeInsets.only(bottom: 12.0),
//                       child: _quizcard(context, quiz),
//                     )),
//                 ],
//               ),
//             ),
//         ),
//  ),
//     );
//   }

// Widget _quizcard(BuildContext context, QuizItem quiz) {
//   return Card(
//     margin: const EdgeInsets.symmetric(vertical: 10.0),
//     elevation: 4,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Row(
//         children: [
//           Image.asset(
//             quiz.image,
//             width: 100,
//             height: 60,
//             fit: BoxFit.contain,
//           ),
//           const SizedBox(width: 10.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   quiz.title,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   quiz.description,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     // color: Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 10),

//                 // ✅ This Row now spaces evenly between question, time, and button
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Question info
//                     Row(
//                       children: [
//                         const Icon(Icons.quiz, size: 16.0),
//                         const SizedBox(width: 5),
//                         Text(
//                           '${quiz.totalQuestions} Questions',
//                           style: const TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Time info
//                     Row(
//                       children: [
//                         const Icon(Icons.timer, size: 16.0),
//                         const SizedBox(width: 5),
//                         Text(
//                           '${quiz.time} Mins',
//                           style: const TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Elevated button
//                     ElevatedButton(
//                       onPressed: () {
//                         print('Navigating to ${quiz.route} with ${quiz.title}');
//                         Navigator.of(context, rootNavigator: true).pushNamed(
//                           RouteGenerator.quizdetail,
//                           arguments: quiz,
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 5),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       child: const Icon(Icons.arrow_right, size: 28),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// }



import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/models/quiz_items_models.dart';
import 'package:tech_triva_quiz_app/utils/route_generator.dart';
import 'package:tech_triva_quiz_app/data/get_quiz_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizList = getQuizList();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: colorScheme.primary,
        title: Text(
          'Home',
          style: textTheme.titleLarge?.copyWith(
            // color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.onPrimary, width: 2),
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
                SizedBox(height: 20,),
                // 👋 Welcome text
                Text(
                  'Welcome Back',
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5.0),

                Text(
                  'What do you want to improve today?',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 10.0),

                // 🧩 Quiz cards
                ...quizList.map((quiz) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: _quizCard(context, quiz, colorScheme, textTheme),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _quizCard(
    BuildContext context,
    QuizItem quiz,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: colorScheme.shadow.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              quiz.image,
              width: 100,
              height: 60,
              fit: BoxFit.contain,
              // color: colorScheme.primary.withOpacity(0.6),
              colorBlendMode: BlendMode.srcATop,
            ),
            const SizedBox(width: 10.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🏷️ Title
                  Text(
                    quiz.title,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // 📖 Description
                  Text(
                    quiz.description,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ⏱ Info row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 🧩 Questions count
                      Row(
                        children: [
                          Icon(Icons.quiz,
                              size: 16.0, color: colorScheme.primary),
                          const SizedBox(width: 5),
                          Text(
                            '${quiz.totalQuestions} Questions',
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 13,
                              color: colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),

                      // ⏰ Time
                      Row(
                        children: [
                          Icon(Icons.timer,
                              size: 16.0, color: colorScheme.secondary),
                          const SizedBox(width: 5),
                          Text(
                            '${quiz.time} Mins',
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 13,
                              color: colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),

                      // ▶️ Start Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            RouteGenerator.quizdetail,
                            arguments: quiz,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
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
