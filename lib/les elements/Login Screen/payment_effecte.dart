import 'package:app_e_ecommerce/les%20elements/Home/home_scren.dart';
import 'package:app_e_ecommerce/les%20elements/Login%20Screen/signup_screen.dart';
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
                SizedBox(height: 300),
                Center(
                  child: Image.asset(
                      'images/rrr.png',
                      height: 200,
                    ),
                ),
                 SizedBox(height: 20,),
                 Center(
                   child: Text("PAYMENT EFFECTE",
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
