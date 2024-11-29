// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';



class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameoncardController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  void processPayment() {
    String cardNumber = _cardNumberController.text.trim();
    String nameoncard = _nameoncardController.text.trim();
    String expiryDate = _expiryDateController.text.trim();
    String cvv = _cvvController.text.trim();

    if (cardNumber.isEmpty || expiryDate.isEmpty || cvv.isEmpty) {
      _showDialog("Error", "Please fill in all fields.");
      return;
    }

    // تنفيذ منطق الدفع هنا (تكامل مع Stripe أو أي نظام آخر)
   

    // عرض رسالة نجاح بعد إتمام الدفع
    
    _showDialog(
      "Congratulations!", 
      "Payment has been made successfully and the watch has been purchased.");
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Agree"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: const Center(
          
          child: Text(
          "Payment",
           style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            ),),),

      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          const Image(  
                height: 260,
                width: 600,
                image: AssetImage("images/Payments.png"),
                ),

            const SizedBox(height: 80),
            TextField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Card number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _nameoncardController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Name On Card",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _expiryDateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: "Expiry date (MM/YY)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _cvvController,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "CVV",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(

              onPressed:  processPayment,

              icon:const Icon(
                Icons.payment,size: 30),

              label: const Text(
                "Complete payment",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.pink
                    ),
                    ),
                    ),
          ],
        ),
      ),
    );
  }
}
