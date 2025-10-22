import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/app.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
      ),
  );
}


