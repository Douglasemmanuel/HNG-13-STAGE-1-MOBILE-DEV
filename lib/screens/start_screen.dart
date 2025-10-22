
import 'package:flutter/material.dart';
import 'package:tech_triva_quiz_app/utils/route_generator.dart' ;

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // for responsive sizing
    final colorScheme = Theme.of(context).colorScheme; // ✅ use theme colors
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tech Trivia Quiz',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: colorScheme.primary,
                          // foreground: Colors.blueAccent ,
                        ),
                    textAlign: TextAlign.center,
                  ),
          
                  const SizedBox(height: 40),
          
                  // Responsive image
                  Image.asset(
                    'assets/images/quiz-logo.png',
                    width: size.width * 0.8,
                    height: size.height * 0.4,
                    fit: BoxFit.contain,
                     color: colorScheme.primary.withOpacity(0.2), 
                    colorBlendMode: BlendMode.srcATop,
                  ),
          
                  const SizedBox(height: 100),
                  Text(
                    'Hi Start to begin Quiz',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: colorScheme.onSurface,
                        ),
                    textAlign: TextAlign.center,
                  
                  ),
                  const SizedBox(height: 20),
                 ElevatedButton(
                  onPressed: () {
                    Navigator.of( context , rootNavigator: true).pushNamed(RouteGenerator.home) ;
                    
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: const Size(0, 50.0),
                  ),
                  child:  Row(
                    mainAxisSize: MainAxisSize.min, 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome' ,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 50), 
                      Icon(Icons.arrow_right_alt, size: 30),
                    ],
                  ),
                    ),
                //   Positioned(
                //   bottom: 59,
                //   left: 0,
                //   right: 0,
                //   child: Text(
                //     'built with flutter',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w500,
                //       color: Colors.grey[600],
                //     ),
                //   ),
                // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
