import 'package:tech_triva_quiz_app/models/quiz_items_models.dart' ;
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;
import 'package:tech_triva_quiz_app/data/questions_data.dart' ;
List<QuizItem> getQuizList() {
  return [
    QuizItem(
      title: 'Flutter Quiz',
      description: 'Test your knowledge of Flutter development!',
      image: 'assets/images/flutter.png',
      route: RouteGenerator.quizdetail,
      totalQuestions: 10,
      time: 10, 
      questions: flutterQuestions,
    ),
    QuizItem(
      title: 'React Native Quiz',
      description: 'Challenge yourself with React Native questions!',
      image: 'assets/images/reactnative.png',
      route: RouteGenerator.quizdetail,
      totalQuestions: 10,
      time: 10,
      questions:reactNativeQuestions ,
    ),
  ];
}
