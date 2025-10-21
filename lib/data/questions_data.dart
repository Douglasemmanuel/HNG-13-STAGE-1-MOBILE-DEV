import 'package:tech_triva_quiz_app/models/quiz_question_models.dart'; 

// ✅ Flutter quiz questions
final List<QuizQuestion> flutterQuestions = [
  QuizQuestion(
    question: 'What are the main building blocks of Flutter UIs?',
    options: ['Widgets', 'Components', 'Blocks', 'Functions'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Which language is used to write Flutter apps?',
    options: ['Kotlin', 'Java', 'Dart', 'Swift'],
    correctAnswerIndex: 2,
  ),
  QuizQuestion(
    question: 'What widget is used to lay out children vertically?',
    options: ['Row', 'Column', 'Stack', 'ListView'],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    question: 'Which command is used to create a new Flutter project?',
    options: ['flutter create', 'flutter new', 'flutter init', 'flutter start'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'What is the purpose of the setState() method?',
    options: [
      'To rebuild the widget tree with updated data',
      'To destroy a widget',
      'To navigate to another screen',
      'To refresh the app manually'
    ],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'What widget is used to make something scrollable in Flutter?',
    options: ['ListView', 'Container', 'Card', 'SizedBox'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'What does the “hot reload” feature do?',
    options: [
      'Restarts the app completely',
      'Updates code changes instantly without losing state',
      'Clears cache',
      'Compiles code manually'
    ],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    question: 'What is the parent class of all Flutter widgets?',
    options: ['Widget', 'StatelessWidget', 'StatefulWidget', 'BuildContext'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Which widget allows layering of widgets on top of each other?',
    options: ['Stack', 'Column', 'Row', 'ListView'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Which file stores the dependencies in a Flutter project?',
    options: ['pubspec.yaml', 'main.dart', 'build.gradle', 'settings.json'],
    correctAnswerIndex: 0,
  ),
];

// ✅ React Native quiz questions
final List<QuizQuestion> reactNativeQuestions = [
  QuizQuestion(
    question: 'Which language is primarily used in React Native?',
    options: ['Java', 'Kotlin', 'JavaScript', 'Swift'],
    correctAnswerIndex: 2,
  ),
  QuizQuestion(
    question: 'Which company developed React Native?',
    options: ['Google', 'Facebook', 'Microsoft', 'Apple'],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    question: 'What is the command to create a new React Native app?',
    options: [
      'npx react-native init AppName',
      'npm create react-app',
      'expo make app',
      'react-native new App'
    ],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Which component is used to display text in React Native?',
    options: ['Paragraph', 'Label', 'Text', 'Span'],
    correctAnswerIndex: 2,
  ),
  QuizQuestion(
    question: 'Which hook is used to manage state in React?',
    options: ['useState', 'useEffect', 'useMemo', 'useCallback'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Which CLI tool is used to run React Native apps?',
    options: ['npm start', 'expo start', 'react-native run', 'npx react-native run'],
    correctAnswerIndex: 3,
  ),
  QuizQuestion(
    question: 'How do you style components in React Native?',
    options: [
      'Using CSS files',
      'Using the StyleSheet API',
      'Using inline HTML styles',
      'Using Bootstrap'
    ],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    question: 'What command is used to run the Android emulator?',
    options: [
      'npx react-native run-android',
      'npm start android',
      'expo run android',
      'npx android-start'
    ],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Which lifecycle hook is similar to componentDidMount in React?',
    options: ['useEffect', 'useState', 'useRef', 'useReducer'],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    question: 'Which file is used to define app dependencies in React Native?',
    options: ['package.json', 'index.js', 'App.js', 'babel.config.js'],
    correctAnswerIndex: 0,
  ),
];
