import 'package:app_e_ecommerce/View/les%20elements/Home/home_scren.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/signup_screen.dart';
import 'package:flutter/material.dart';

class login_screen extends StatelessWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [

                const SizedBox(height: 100),

                Image.asset(
                    'images/mod.png',
                    height: 270,
                  ),

                 const SizedBox(height: 30,),

                 Text(
                  "Welcome To My Account",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 30,),

                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  padding:  const EdgeInsets.only(left: 20, right: 15),
                  height: 60,
                  decoration: BoxDecoration(
                    color:  const Color(0xFFFFFFFF),
                    borderRadius:  const BorderRadius.only(
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                    ),
                    border: Border.all(color: Colors.indigo, width: 1.5),
                    boxShadow:  const [
                      BoxShadow(
                        color: Color(0xFFE7EEF8),
                        blurRadius: 1.0,
                        offset: Offset(2.6, 2.6),
                      ),
                    ],
                  ),

                  child: Center(
                    child: TextFormField(
                      decoration:  const InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.mail),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:  const EdgeInsets.only(left: 20, right: 15),
                  height: 60,
                  decoration: BoxDecoration(
                    color:  const Color(0xFFFFFFFF),
                    borderRadius:  const BorderRadius.only(
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                    ),
                    border: Border.all(color: Colors.indigo, width: 1.5),
                    boxShadow:  const [
                      BoxShadow(
                        color: Color(0xFFE7EEF8),
                        blurRadius: 1.0,
                        offset: Offset(2.6, 2.6),
                      ),
                    ],
                  ),

                  child: Center(
                    child: TextFormField(
                      obscureText: true,
                      decoration:  const InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                         Navigator.push(
                          context,
                         MaterialPageRoute(
                          builder:(context)=> const HomeScreen(),
                          ));
                      },

                      child: Container(
                        margin:  const EdgeInsets.symmetric(horizontal: 10),
                        padding:  const EdgeInsets.symmetric(horizontal: 35),
                        height: 60,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        decoration:  BoxDecoration(
                          color: Colors.orangeAccent.shade700,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(55),
                            bottomRight: Radius.circular(55),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 1.0,
                              offset: Offset(2.6, 2.6),
                            ),
                          ],
                        ),

                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Log IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(width: 8),

                            Icon(
                                Icons.login,
                                color: Colors.white,
                                size: 30
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                         MaterialPageRoute(builder:(context)
                         => const sighupScreen() ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        height: 60,
                        width: MediaQuery.of(context).size.width /3,
                        decoration:  BoxDecoration(
                          color: Colors.orangeAccent.shade700,
                          borderRadius:const BorderRadius.only(
                            topLeft:Radius.circular(55),
                            bottomRight:Radius.circular(55),
                            topRight:Radius.circular(8),
                            bottomLeft:Radius.circular(8),
                          ),

                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFE7EEF8),
                              blurRadius: 1.0,
                              offset: Offset(2.6,2.6),
                            ),
                          ],
                        ),

                        child:   const Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(color: Color(0xFFE7EEF8),
                        blurRadius: 4.0,
                        offset: Offset(0.6, 0.7),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      ),

                       child: Image.asset(
                        "images/google_icon.png"
                        ),
                    ),

                    const SizedBox(width: 30),

                     Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(color: Color(0xFFE7EEF8),
                        blurRadius: 4.0,
                        offset: Offset(0.6, 0.7),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                      ),
                       child: Image.asset(
                        "images/facebook_icon.png"
                        ),
                    )
                  ],
                )
              ],
            )
            ),
      ),
    );
  }
}
