import 'package:flutter/material.dart';

class LanguageInfoScreen extends StatelessWidget {
  const LanguageInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          'Language Information'
          ),

        centerTitle: true,
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.language,
              size: 100,
              color: Colors.blue,
            ),

            SizedBox(height: 20),

            Text(
              'Welcome to the Language Information Screen!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
