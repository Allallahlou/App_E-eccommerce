// ignore_for_file: file_names
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_button.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController(); // متغير لتأكيد كلمة المرور
  Color _buttonColor = Colors.deepPurple;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startColorAnimation();
  }

  void _startColorAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _buttonColor = Color((0xFF000000 + (timer.tick * 0x100000)) % 0xFFFFFF)
            // ignore: deprecated_member_use
            .withOpacity(1.0);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose(); // التخلص من المتغير الجديد
    super.dispose();
  }

  void _onSignUpPressed() {
    // التحقق من تطابق كلمة المرور وكلمة المرور المؤكدة
    if (passwordController.text == confirmPasswordController.text) {
      // تنفيذ عملية التسجيل هنا
    } else {
      // عرض رسالة خطأ في حالة عدم تطابق كلمات المرور
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمات المرور غير متطابقة')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade900, Colors.blue.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Lottie.asset(
                  "Json/signup.json",
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            isEnglish ? "Create Account" : "إنشاء حساب",
                            style: isEnglish
                                ? GoogleFonts.montserrat(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )
                                : GoogleFonts.cairo(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          Card(
                            // ignore: deprecated_member_use
                            color: Colors.white.withOpacity(0.9),
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: fullNameController,
                                    hintText:
                                        isEnglish ? "Username" : "الاسم الكامل",
                                    icon: Icons.person,
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextField(
                                    controller: emailController,
                                    hintText:
                                        isEnglish ? "Email" : "بريد إلكتروني",
                                    icon: Icons.email,
                                  ),
                                  const SizedBox(height: 15),
                                  CustomTextField(
                                    controller: passwordController,
                                    hintText:
                                        isEnglish ? "Password" : "كلمة المرور",
                                    icon: Icons.lock,
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 15),
                                  // إضافة حقل تأكيد كلمة المرور
                                  CustomTextField(
                                    controller: confirmPasswordController,
                                    hintText: isEnglish
                                        ? "Confirm Password"
                                        : "تأكيد كلمة المرور",
                                    icon: Icons.lock,
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            child: SizedBox(
                              width: 150,
                              height: 45,
                              child: CustomButton(
                                label: isEnglish ? "Sign Up" : "قم بالتسجيل",
                                color: _buttonColor,
                                onPressed:
                                    _onSignUpPressed, // ربط التحقق عند الضغط على الزر
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
