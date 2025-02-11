import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; // إضافة مكتبة Firebase Auth
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool get isEnglish {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return languageProvider.currentLocale.languageCode == 'en';
  }

  // دالة إرسال رابط إعادة تعيين كلمة المرور
  void _sendResetLink() async {
    String email = _emailController.text.trim();

    // التحقق من صحة البريد الإلكتروني
    if (email.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      _showDialog("Error", "Please enter a valid email.");
      return;
    }

    try {
      // إرسال رابط إعادة تعيين كلمة المرور باستخدام Firebase
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      _showDialog("Success", "Password reset link sent successfully.");
    } on FirebaseAuthException catch (e) {
      // التعامل مع الأخطاء
      _showDialog("Error", e.message ?? "An error occurred.");
    }
  }

  // دالة لعرض الحوار
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
              child: Text(
                isEnglish ? "Agree" : "موافقة",
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
      body: Stack(
        children: [
          Image.asset(
            'images/eco.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      isEnglish ? "Forgot Password?" : "هل نسيت كلمة السر؟",
                      style: GoogleFonts.adamina(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isEnglish
                          ? "Enter your email to reset your password"
                          : "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك",
                      style: GoogleFonts.adamina(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    _buildTextField(
                      controller: _emailController,
                      hintText: isEnglish ? "Email" : "بريد إلكتروني",
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    _buildButton(
                      context: context,
                      label: isEnglish
                          ? "Send Reset Link"
                          : "إرسال رابط إعادة الضبط",
                      onPressed: _sendResetLink,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        isEnglish ? "Back to Login" : "العودة إلى تسجيل الدخول",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة حقل الإدخال
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.pinkAccent),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  // دالة زر الإجراء
  Widget _buildButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
