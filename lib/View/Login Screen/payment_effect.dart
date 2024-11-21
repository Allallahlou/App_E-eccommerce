import 'package:flutter/material.dart';

class PaymentsEffectScreen extends StatelessWidget {
  const PaymentsEffectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 300),
                Center(
                  child: Image.asset(
                      'images/validation.png',
                      height: 200,
                    ),
                ),
                 const SizedBox(height: 20,),
                 Center(
                   child: Text("Payment Effect",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                                   ),
                 ),
                ],
                ),
                ),
                ),
    );
  }
}
