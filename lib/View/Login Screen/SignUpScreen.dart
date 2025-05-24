// ignore_for_file: file_names, deprecated_member_use
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_button.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:app_e_ecommerce/ApiService/ApiService.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Color _buttonColor = const Color(0xFFFF7E5F); // بداية بلون برتقالي فاتح
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startColorAnimation();
  }

  void _startColorAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _buttonColor = _buttonColor == const Color(0xFFFF7E5F)
            ? const Color(0xFFFD3A69)
            : const Color(0xFFFF7E5F);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() async {
    if (passwordController.text == confirmPasswordController.text) {
      final token = await ApiService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (token != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful. Token: $token')),
        );
        // هنا يمكنك التنقل للشاشة الرئيسية مثلاً بعد تسجيل الدخول
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              Provider.of<LanguageProvider>(context, listen: false)
                          .currentLocale
                          .languageCode ==
                      'en'
                  ? 'Invalid email or password'
                  : 'البريد الإلكتروني أو كلمة المرور غير صحيحة',
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Provider.of<LanguageProvider>(context, listen: false)
                        .currentLocale
                        .languageCode ==
                    'en'
                ? 'Passwords do not match'
                : 'كلمات المرور غير متطابقة',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    const Color startColor = Color(0xFFFF7E5F); // برتقالي فاتح
    const Color endColor = Color(0xFFFD3A69); // برتقالي مائل للأحمر

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login_Screen()),
                );
              },
            ),
            title: Text(
              isEnglish ? "Create Account" : "إنشاء حساب",
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
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
                        Card(
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
                                  controller: firstNameController,
                                  hintText: isEnglish
                                      ? "username"
                                      : "   الاسم الكامل",
                                  icon: Icons.person,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  controller: emailController,
                                  hintText:
                                      isEnglish ? "Email" : "بريد إلكتروني",
                                  icon: Icons.email,
                                ),
                                const SizedBox(height: 8),
                                CustomTextField(
                                  controller: passwordController,
                                  hintText:
                                      isEnglish ? "Password" : "كلمة المرور",
                                  icon: Icons.lock,
                                  obscureText: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          child: SizedBox(
                            width: 150,
                            height: 45,
                            child: CustomButton(
                              label: isEnglish ? "Sign Up" : "قم بالتسجيل",
                              color: _buttonColor,
                              onPressed: _onSignUpPressed,
                            ),
                          ),
                        ),
                      ],
                    ),
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
