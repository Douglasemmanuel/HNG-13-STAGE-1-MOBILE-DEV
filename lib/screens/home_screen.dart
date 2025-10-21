import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  centerTitle: true, 
  // automaticallyImplyLeading: false,
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2), // optional border
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



      body: SingleChildScrollView(
           child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [

                Text(
                  'welcome Back',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    
                  ),
                  textAlign: TextAlign.left,
                  ),
                  SizedBox(height:5.0),
                  Text(
                  'what do yo want to improve today?',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                   textAlign: TextAlign.left,
                  ),
                   SizedBox(height:15.0),
              ],
            ),
          ),
      ),
    );
  }

  Widget _quizcard(BuildContext context){
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Image.asset(
                'assets/images/ Douglas.jpeg',
                width: 100,
                height: 50,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  
                ),
                ),
          ],
        
        ),
      ),
    );

  }
}

