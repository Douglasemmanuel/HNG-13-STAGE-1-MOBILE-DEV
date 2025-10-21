import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}