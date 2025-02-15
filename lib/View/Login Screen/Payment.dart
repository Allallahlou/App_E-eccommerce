import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _cardNumberController = TextEditingController();
  final _nameOnCardController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _nameOnCardController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void processPayment() {
    if (_cardNumberController.text.isEmpty ||
        _expiryDateController.text.isEmpty ||
        _cvvController.text.isEmpty ||
        _nameOnCardController.text.isEmpty) {
      _showDialog("❌ Error", "Please fill in all fields.");
      return;
    }

    _showDialog(
      "🎉 Congratulations!",
      "Payment has been made successfully and the watch has been purchased.",
    );

    // إعادة تعيين الحقول بعد الدفع
    setState(() {
      _cardNumberController.clear();
      _nameOnCardController.clear();
      _expiryDateController.clear();
      _cvvController.clear();
    });
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        final languageProvider = Provider.of<LanguageProvider>(context);
        bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                isEnglish ? "OK" : "موافق",
                style: const TextStyle(fontWeight: FontWeight.bold),
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
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Stack(
      children: [
        // الخلفية
        Positioned.fill(
          child: Image.asset(
            "images/ecom.png", // تأكد من أن الصورة موجودة في مجلد assets
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // لضمان ظهور الخلفية
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey, // لون شفاف قليلاً
            title: Center(
              child: Text(
                isEnglish ? "Payment" : "الدفع",
                style: GoogleFonts.adamina(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: .5,
                  ),
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Card(
                    color: Colors.white.withOpacity(0.9), // شفافية للكارد
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Image(
                            height: 280,
                            width: double.infinity,
                            image: AssetImage("images/Payments.png"),
                          ),
                          const SizedBox(height: 20),
                          _buildTextField(
                            controller: _cardNumberController,
                            label: isEnglish ? "Card Number" : "رقم البطاقة",
                            icon: Icons.credit_card,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            controller: _nameOnCardController,
                            label: isEnglish
                                ? "Name on Card"
                                : "الاسم على البطاقة",
                            icon: Icons.person,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            controller: _expiryDateController,
                            label: isEnglish
                                ? "Expiry Date (MM/YY)"
                                : "(MM/YY) تاريخ انتهاء الصلاحية",
                            icon: Icons.date_range,
                            keyboardType: TextInputType.datetime,
                          ),
                          const SizedBox(height: 15),
                          _buildTextField(
                            controller: _cvvController,
                            label: isEnglish ? "CVV" : "رمز التحقق",
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
                    icon: const Icon(
                      Icons.payment,
                      size: 28,
                    ),
                    label: Text(
                      isEnglish ? "Make Payment" : "إتمام الدفع",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      backgroundColor: Colors.black,
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
        ),
      ],
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
