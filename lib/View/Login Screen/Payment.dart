import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

    _showDialog(
      "Congratulations!", 
      "Payment has been made successfully and the watch has been purchased.",
    );
  }

  void _showDialog(String title, String content) {

    showDialog(
      context: context,
      builder: (context) {
              final languageProvider = Provider.of<LanguageProvider>(context);

        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:Text(
                 languageProvider.currentLocale.languageCode == 'en'
                                    ? " Agree"
                                    : " يوافق ",
                ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
          final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        title: Center(
          child: Text(
             languageProvider.currentLocale.languageCode == 'en'
                                    ? " Payment"
                                    : "الدفع",
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                fontSize: 24,
                letterSpacing: .5,
              ),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.pinkAccent.shade400),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Image(
                        height: 180,
                        width: double.infinity,
                        image: AssetImage("images/Payments.png"),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _cardNumberController,
                        label: languageProvider.currentLocale.languageCode == 'en'
                                    ? " Card Number"
                                    : "  رقم البطاقة", 
                        icon: Icons.credit_card,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: _nameoncardController,
                        label: languageProvider.currentLocale.languageCode == 'en'
                                    ? " Name on Card"
                                    : " الاسم على البطاقة ", 
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: _expiryDateController,
                        label: languageProvider.currentLocale.languageCode == 'en'
                                    ? " Expiry Date (MM/YY)"
                                    : " (MM/YY) تاريخ انتهاء الصلاحية ", 
                        icon: Icons.date_range,
                        keyboardType: TextInputType.datetime,
                      ),
                      const SizedBox(height: 15),
                      _buildTextField(
                        controller: _cvvController,
                        label: languageProvider.currentLocale.languageCode == 'en'
                                    ? " CVV"
                                    : "رمز التحقق ",
                        icon: Icons.lock,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: processPayment,
                icon: const Icon(Icons.payment, size: 28),
                label:  Text(
                   languageProvider.currentLocale.languageCode == 'en'
                                    ? "  Payment"
                                    : "  الدفع ",
                  
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.pinkAccent.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.pinkAccent.shade400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.pinkAccent.shade400, width: 2),
        ),
      ),
    );
  }
}
