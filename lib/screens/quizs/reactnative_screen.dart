import 'package:flutter/material.dart';

class ReactnativeScreen extends StatelessWidget {
  const ReactnativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
      child: Text('ReactNative'),
    ),
      ),
    );
  }
}