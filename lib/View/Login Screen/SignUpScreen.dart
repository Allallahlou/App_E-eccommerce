import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                    colors: [
                      Colors.purpleAccent,
                      Colors.blueAccent,
                      ],
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

                  const SizedBox(
                    height: 40,
                    ),

                   Text(
                      languageProvider.currentLocale.languageCode == 'en'
                                    ? " Create Account"
                                    : " إنشاء حساب ",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  //Input card

                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [

                          _buildInputField(
                            hintText:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Full Name"
                                    : " الاسم الكامل", 
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 15),

                          _buildInputField(
                            hintText:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Phone Number"
                                    : " رقم الهاتف ",
                            icon: Icons.phone,
                          ),

                          const SizedBox(height: 15),

                          _buildInputField(
                            hintText:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Email"
                                    : "بريد إلكتروني", 
                            icon: Icons.email,
                          ),

                          const SizedBox(height: 15),

                          _buildInputField(
                            hintText:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Password"
                                    : "  كلمة المرور",
                            icon: Icons.lock,
                            isPassword: true,
                          ),

                          const SizedBox(height: 15),

                          _buildInputField(
                            hintText:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Confirm Password"
                                    : "  تأكيد كلمة المرور", 
                            icon: Icons.lock,
                            isPassword: true,
                          ),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // زر التسجيل

                  GestureDetector(
                    onTap: () {
                      // وظيفة التسجيل
                    },

                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),

                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child:  Center(
                        child: Text(
                            languageProvider.currentLocale.languageCode == 'en'
                                    ? " Sign Up"
                                    : "  قم بالتسجيل",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // النص وروابط التنقل

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                          languageProvider.currentLocale.languageCode == 'en'
                                    ? " Already have an account?"
                                    : "هل لديك حساب بالفعل؟",

                        style: const TextStyle(
                          color: Colors.white,
                          ),
                      ),
                      TextButton(
                        onPressed: () {
                           Navigator.push(
                           context, MaterialPageRoute(
                           builder: (context) =>  const LoginScreen()
                         ),
                      );
                        },
                        child:  Text(
                            languageProvider.currentLocale.languageCode == 'en'
                                    ? " Log In"
                                    : " تسجيل الدخول",
                          style: const TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Social login buttons

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        "images/google_icon.png"
                        ),
                      const SizedBox(
                        width: 20
                        ),

                      _buildSocialButton(
                        "images/facebook_icon.png"
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 30
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to create an input field

  Widget _buildInputField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  })
   {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Widget to create social media button

  Widget _buildSocialButton(String imagePath) {
    return GestureDetector(
      onTap: () {
        // إضافة وظيفة تسجيل الدخول
      },

      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
