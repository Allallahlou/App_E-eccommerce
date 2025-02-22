// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_button.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/ecom.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  "images/SignUp.png",
                  width: MediaQuery.of(context).size.width / 1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            isEnglish ? "Create Account" : "إنشاء حساب",
                            style: isEnglish
                                ? GoogleFonts.montserrat(
                                    // خط إنجليزي حديث ومغلق
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Colors.black, // واضح في النهار والليل
                                  )
                                : GoogleFonts.cairo(
                                    // خط عربي مغلق وأنيق
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            label: isEnglish ? "Sign Up" : "قم بالتسجيل",
                            onPressed: () {
                              // تنفيذ عملية التسجيل هنا
                            },
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
