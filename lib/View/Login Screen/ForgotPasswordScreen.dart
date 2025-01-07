import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                  ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100
                      ),

                    
                    Text(
                        languageProvider.currentLocale.languageCode == 'en'
                                    ? " Forgot Password?"
                                    : "هل نسيت كلمة السر؟",
                      
                      style: GoogleFonts.adamina(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      languageProvider.currentLocale.languageCode == 'en'
                                    ? " Enter your email to reset your password"
                                    : "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك",
                      style: GoogleFonts.adamina(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 50),

                     //Email field

                    _buildTextField(
                      hintText:languageProvider.currentLocale.languageCode == 'en'
                                    ? "Email"
                                    : "بريد إلكتروني",
                      icon: Icons.email,
                    ),

                    const SizedBox(height: 20),

                    //Send link button

                    _buildButton(
                      context: context,
                      label:languageProvider.currentLocale.languageCode == 'en'
                                    ? " Send Reset Link"
                                    : "إرسال رابط إعادة الضبط", 
                      onPressed: () {
                        // أضف هنا وظيفة إرسال الرابط
                      },
                    ),

                    const SizedBox(height: 20),

                    
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child:  Text(
                        languageProvider.currentLocale.languageCode == 'en'
                                    ? " Back to Login"
                                    : " العودة إلى تسجيل الدخول ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
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
    );
  }

  // Input field

  Widget _buildTextField({
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
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.pinkAccent),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

   // Action button
   
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
