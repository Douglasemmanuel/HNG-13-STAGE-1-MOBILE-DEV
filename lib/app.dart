import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: HomeScreen(),
      initialRoute: RouteGenerator.initial,
      debugShowCheckedModeBanner: false,
    );
  }
}