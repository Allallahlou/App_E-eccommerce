import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

                  // قائمة المنتجات في السلة

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
      "quantity": 1},
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

            // حساب الإجمالي

  double getTotal() {
    return cartItems.fold(
      0, (sum, item) =>
       sum + (item['price'] * item['quantity']),
       );
  }

  @override
  Widget build(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Center(

          child: Text(

            languageProvider.currentLocale.languageCode == 'en'
                                    ? "Shopping Cart"
                                    : "عربة التسوق",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
              ),

            ),
        leading: IconButton(

          icon: const Icon(
            Icons.arrow_back
            ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen()
                ),
            );
          },
        ),
      ),

      body: Column(
        children: [

          // عرض قائمة المنتجات

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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [

                              // صورة المنتج

                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      item['image']
                                      ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 16),

                              // تفاصيل المنتج

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      "${item['price']} Euro",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // التحكم في الكمية

                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove
                                      ),

                                    onPressed: () {
                                      setState(() {
                                        if (item['quantity'] > 1) {
                                          item['quantity']--;
                                        } else {
                                          cartItems.removeAt(index);
                                        }
                                      }
                                      );
                                    },
                                  ),

                                  Text(
                                    "${item['quantity']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      ),
                                  ),

                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        item['quantity']++;
                                      }
                                      );
                                    },
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
                       languageProvider.currentLocale.languageCode == 'en'
                                    ? "Your cart is empty! "
                                    : "سلة التسوق الخاصة بك فارغة! ",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
          ),

          // عرض الإجمالي وزر الدفع

          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                       languageProvider.currentLocale.languageCode == 'en'
                                    ? "Total "
                                    : "مجموع ",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        ),
                    ),

                    Text(
                      "${getTotal().toStringAsFixed(2)} Euro",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: cartItems.isNotEmpty
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentScreen()
                              ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                      ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:  Text(
                     languageProvider.currentLocale.languageCode == 'en'
                                    ? "Proceed To Payment"
                                    : "انتقل إلى الدفع",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
