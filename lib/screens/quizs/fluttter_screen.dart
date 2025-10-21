import 'package:flutter/material.dart';

class FluttterScreen extends StatelessWidget {
  const FluttterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
      child: Text('Flutter'),
    ),
      ),
    );
  }
}