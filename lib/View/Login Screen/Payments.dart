// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/Login%20Screen/payment_effect.dart';
import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(  body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                 const SizedBox(height: 50,),
                 const Align(
                   alignment:Alignment.bottomLeft,
                   child: Center(
                     child: Text("   Payments",style: TextStyle(
                       fontSize: 30,
                       color: Colors.pink,
                       fontWeight: FontWeight.bold,
                       letterSpacing: 1,
                     ),),
                   ),
                     ),
                const SizedBox(height: 20,),
              const Image(  
                height: 180,
              image:NetworkImage('https://www.indusind.com/iblogs/wp-content/uploads/06_CC_Banner-Image.jpg'),
              ),
              const SizedBox(height: 20),
                const Align(
                  alignment:Alignment.bottomLeft,
                  child: Text("    Card Number",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    ),),
                   
                    ),
                const SizedBox(height: 20,),
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  padding:  const EdgeInsets.only(left: 20, right: 15),
                  height: 60,
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius:  const BorderRadius.only(
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                    ),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 1.5
                      ),
                    boxShadow:   const [
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
                        hintText: "                                   1234 5678 9012 3456",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ), 
                const SizedBox(height: 20,),
            const Align(
              alignment:Alignment.bottomLeft,
              child: Text("    Name On Card",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                ),),
               
                ),
                const SizedBox(height: 20,),
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
                      decoration:  const InputDecoration(
                        hintText: "                                     Ex. John Website",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Align(
                  alignment:Alignment.bottomLeft,
                  child: Text("    Expiry date",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    ),),
                   
                    ),
                const SizedBox(height: 20,),
                Container(
                  margin:  const EdgeInsets.symmetric(horizontal: 20),
                  padding:  const EdgeInsets.only(left: 20, right: 15),
                  height: 60,
                  decoration: BoxDecoration(
                    color:  Colors.white,
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
                        hintText: "                                            01/ 19",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment:Alignment.bottomLeft,
                  child: Text("    Card Number",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    ),),
                   
                    ),
                 const SizedBox(height: 20),
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
                      obscureText: true,
                      decoration:   const InputDecoration(
                        hintText: "                                                 ***",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                 const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                     Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder:(context)=> const PaymentsEffectScreen()
                            ),
                            );
                     },
                      child: const Text(
                        "Next",style: TextStyle(
                          color: Colors.orange
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
