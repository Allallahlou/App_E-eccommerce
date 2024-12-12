import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings'
          ),
        backgroundColor: const Color(0xFF113953),
      ),
      body: const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(
            fontSize: 20
            ),
        ),
      ),
    );
  }
}
