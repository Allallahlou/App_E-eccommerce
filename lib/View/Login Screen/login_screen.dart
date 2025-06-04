import 'package:app_e_ecommerce/api_service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import 'package:app_e_ecommerce/View/Login%20Screen/ForgotPasswordScreen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/SignUpScreen.dart'; // هذا مهم
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoginPressed = false;
  bool isSignUpPressed = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    const Color startColor = Color(0xFFFF7E5F);
    const Color endColor = Color(0xFFFD3A69);

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
            title: Text(
              isEnglish ? "LOGIN ACCOUNT" : "تسجيل الدخول إلى حسابك",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: kToolbarHeight + 20),
                Lottie.asset("Json/lo.json", width: 300, height: 300),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: isEnglish ? "Email" : "البريد الإلكتروني",
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: isEnglish ? "Password" : "كلمة المرور",
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            isEnglish
                                ? "Forgot Password?"
                                : "هل نسيت كلمة السر؟",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // زر تسجيل الدخول
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isLoginPressed
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  isLoginPressed = true;
                                  isSignUpPressed = false;
                                });

                                final email = _emailController.text.trim();
                                final password =
                                    _passwordController.text.trim();

                                final token =
                                    await ApiService.login(email, password);

                                if (token != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(isEnglish
                                          ? 'Login successful!'
                                          : 'تم تسجيل الدخول بنجاح'),
                                    ),
                                  );
                                  // Navigator.pushReplacementNamed(context, "home");
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(isEnglish
                                          ? 'Login failed'
                                          : 'فشل تسجيل الدخول'),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                isEnglish ? "Login" : "تسجيل الدخول",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isLoginPressed
                                      ? startColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),

                          // زر التسجيل SignUp
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSignUpPressed
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isLoginPressed = false;
                                  isSignUpPressed = true;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignUpScreen()),
                                );
                              },
                              child: Text(
                                isEnglish ? "Sign Up" : "قم بالتسجيل",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSignUpPressed
                                      ? startColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
