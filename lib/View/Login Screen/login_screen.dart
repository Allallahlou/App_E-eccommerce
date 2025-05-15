import 'package:app_e_ecommerce/View/Login%20Screen/ForgotPasswordScreen.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {
  bool isLoginPressed = false;
  bool isSignUpPressed = false;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 223, 135, 3),
                Color.fromARGB(255, 236, 14, 136)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Lottie.asset(
                  "Json/lo.json",
                  width: 400,
                  height: 400,
                ),
                const SizedBox(height: 5),
                Text(
                  isEnglish
                      ? "LOGIN TO YOUR ACCOUNT"
                      : "تسجيل الدخول إلى حسابك",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: isEnglish ? "Email" : "البريد الإلكتروني",
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
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
                                builder: (context) =>
                                    const ForgotPasswordScreen(),
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isLoginPressed
                                  ? Colors.deepPurple
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isLoginPressed = true;
                                  isSignUpPressed = false;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(context, "homepage");
                                });
                              },
                              child: Text(
                                isEnglish ? "Login" : "تسجيل الدخول",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isLoginPressed
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isSignUpPressed
                                  ? Colors.orange
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isSignUpPressed = true;
                                  isLoginPressed = false;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 300), () {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(context, "signup");
                                });
                              },
                              child: Text(
                                isEnglish ? "Sign Up" : "قم بالتسجيل",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSignUpPressed
                                      ? Colors.white
                                      : Colors.lightBlue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
