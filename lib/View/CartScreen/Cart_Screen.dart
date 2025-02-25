// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';

// ignore: camel_case_types
class Card_Screen extends StatefulWidget {
  const Card_Screen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Card_ScreenState createState() => _Card_ScreenState();
}

// ignore: camel_case_types
class _Card_ScreenState extends State<Card_Screen> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "image": "images/Analogique.png",
      "name": "Analogique",
      "price": 100,
      "quantity": 1,
    },
    {
      "image": "images/Apple_Swatch_Black.png",
      "name": "Apple Swatch Black",
      "price": 280,
      "quantity": 1,
    },
    {
      "image": "images/Apple_Swatch.png",
      "name": "Apple Swatch",
      "price": 300,
      "quantity": 1,
    },
    {
      "image": "images/Bijoux_Jewelry.png",
      "name": "Bijoux Jewelry",
      "price": 400,
      "quantity": 1,
    },
    {
      "image": "images/Hombre_Irony_Xlite_Red_Attack.png",
      "name": "Hombre Irony Xlite Red Attack",
      "price": 160,
      "quantity": 1,
    },
    {
      "image": "images/Irony_Chrono_New_YVB416_bonfire.png",
      "name": "Irony Chrono New YVB416 bonfire",
      "price": 250,
      "quantity": 1,
    },
    {
      "image": "images/Irony_pour_homme.png",
      "name": "Irony pour homme",
      "price": 270,
      "quantity": 1,
    },
    {
      "image": "images/Mens_Irony_Chronograph.png",
      "name": "Mens Irony Chronograph",
      "price": 320,
      "quantity": 1
    },
    {
      "image": "images/Mens_Swiss_SY23S413.png",
      "name": "Mens Swiss SY23S413",
      "price": 220,
      "quantity": 1,
    },
    {
      "image": "images/Sport_Swatch.png",
      "name": "Sport Swatch",
      "price": 145,
      "quantity": 1,
    },
    {
      "image": "images/Swatchour_YVS426G.png",
      "name": "Swatchour YVS426G",
      "price": 305,
      "quantity": 1
    },
    {
      "image": "images/SYXG110G.png",
      "name": "SYXG110G",
      "price": 245,
      "quantity": 1,
    },
    {
      "image": "images/Unisex_Chronographe_Quartz.png",
      "name": "Unisex Chronographe Quartz",
      "price": 105,
      "quantity": 1,
    },
    {
      "image": "images/YCS590G.png",
      "name": "YCS590G",
      "price": 115,
      "quantity": 1,
    },
    {
      "image": "images/YWS420G_Menichelli.png",
      "name": "YWS420G Menichelli",
      "price": 45,
      "quantity": 1,
    },
  ];

  double getTotal() => cartItems.fold(
      0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEnglish ? "Shopping Cart" : "عربة التسوق",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Home_Screen(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item['image'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${item['price']} Euro",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (item['quantity'] > 1) {
                                          item['quantity']--;
                                        } else {
                                          cartItems.removeAt(index);
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    "${item['quantity']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.green,
                                    ),
                                    onPressed: () =>
                                        setState(() => item['quantity']++),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      isEnglish
                          ? "Your cart is empty!"
                          : "سلة التسوق الخاصة بك فارغة!",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEnglish ? "Total" : "المجموع",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${getTotal().toStringAsFixed(2)} Euro",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: cartItems.isNotEmpty
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentScreen(),
                            ),
                          )
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    isEnglish ? "Proceed To Payment" : "انتقل إلى الدفع",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
