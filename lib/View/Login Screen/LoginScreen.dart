import 'package:app_e_ecommerce/View/Login%20Screen/ForgotPasswordScreen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/SignUpScreen.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Stack(
        children: [

           
          Image.asset(
              'images/ecom.png', 
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

                    const SizedBox(height: 100),
                    
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.adamina(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Login to your account",
                      style: GoogleFonts.adamina(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 50),
                  
                     //Email field

                    _buildTextField(
                      hintText: "Email",
                      icon: Icons.email,
                    ),

                    const SizedBox(height: 20),

                     //Password field

                    _buildTextField(
                      hintText: "Password",
                      icon: Icons.lock,
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    // Password recovery link

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => 
                              const ForgotPasswordScreen()
                              ),
                          );

                        },

                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    
                    
                    _buildButton(
                      context: context,
                      label: "Login",
                      onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => 
                              const HomeScreen()
                              ),
                          );
                      },
                    ),
                    const SizedBox(height: 20),

                    
                    _buildButton(
                      context: context,
                      label: "Sign up",
                      onPressed: () {
                        
                         Navigator.push(
                           context, MaterialPageRoute(
                           builder: (context) =>
                             const SignUpScreen()
                         ),
                      );
                      },
                      isSecondary: true,
                    ),

                    const SizedBox(
                      height: 40
                      ),

                    // Log in via Google and Facebook
                    //                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(
                          "images/google_icon.png",
                           () {
                          // وظيفة تسجيل الدخول عبر جوجل
                        }),

                        const SizedBox(width: 20),

                        _buildSocialButton(
                          "images/facebook_icon.png", () {
                          // وظيفة تسجيل الدخول عبر فيسبوك
                        }),
                      ],
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

  // حقل الإدخال

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool obscureText = false,
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
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.pinkAccent
            ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  // زر تسجيل الدخول أو التسجيل

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    bool isSecondary = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: isSecondary ? Colors.white : Colors.pinkAccent,
          borderRadius: BorderRadius.circular(30),
          border: isSecondary
              ? Border.all(
                color: Colors.pinkAccent,
                width: 1.5)
              : null,
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
            style: TextStyle(
              color: isSecondary ? Colors.pinkAccent : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // زر تسجيل الدخول عبر الشبكات الاجتماعية
  Widget _buildSocialButton(
    String imagePath,
    VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              offset: Offset(0, 2),
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
