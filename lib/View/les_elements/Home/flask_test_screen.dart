// flask_test_screen.dart
import 'package:flutter/material.dart';
import '../../../services/api_service.dart';

class Flask_Test_Screen extends StatefulWidget {

  @override
  State<Flask_Test_Screen> createState() => _FlaskTestScreenState();
}

class _FlaskTestScreenState extends State<Flask_Test_Screen> {
  late Future<String> futureMessage;

  @override
  void initState() {
    super.initState();
    futureMessage = ApiService.fetchMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Watch Shop + Flask")),
      body: Center(
        child: FutureBuilder<String>(
          future: futureMessage,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("❌ Error: ${snapshot.error}");
            } else {
              return Text("✅ Flask says: ${snapshot.data}");
            }
          },
        ),
      ),
    );
  }
}
