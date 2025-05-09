// ignore_for_file: file_names, deprecated_member_use

import 'package:app_e_ecommerce/View/CartScreen/MainPage.dart';
import 'package:flutter/material.dart';

class CartButtonPage extends StatelessWidget {
  const CartButtonPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Button Page"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.7),
                  blurRadius: 15,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
