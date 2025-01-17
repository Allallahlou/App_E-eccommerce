import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_button.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/custom_text_field.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/components/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController FullName = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purpleAccent, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    languageProvider.currentLocale.languageCode == 'en'
                        ? "Create Account"
                        : "إنشاء حساب",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          customTextField(
                            hintText:
                                languageProvider.currentLocale.languageCode ==
                                        'en'
                                    ? "Username"
                                    : "الاسم الكامل",
                            icon: Icons.person,
                          ),
                        
                          const SizedBox(height: 15),
                          customTextField(
                            hintText:
                                languageProvider.currentLocale.languageCode ==
                                        'en'
                                    ? "Email"
                                    : "بريد إلكتروني",
                            icon: Icons.email,
                          ),
                          const SizedBox(height: 15),
                          customTextField(
                            hintText:
                                languageProvider.currentLocale.languageCode ==
                                        'en'
                                    ? "Password"
                                    : "كلمة المرور",
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  customButton(
                    context: context,
                    label: languageProvider.currentLocale.languageCode == 'en'
                        ? "Sign Up"
                        : "قم بالتسجيل",
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: Email.text,
                          password: Password.text,
                        );
                        Navigator.of(context).pushReplacementNamed("homepage");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      socialButton(
                        imagePath: "images/google_icon.png",
                        onPressed: () {
                          // Function for Google login
                        },
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}