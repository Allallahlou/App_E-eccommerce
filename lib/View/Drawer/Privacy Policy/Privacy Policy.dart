import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Privacy and Security"   
                   ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "privacy policy",        
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
            ),

            SizedBox(height: 10),

            Text(
              "We respect your privacy and are committed to protecting your data."
              "The information is used only to improve user experience."),
          ],
        ),
      ),
    );
  }
}
