import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/CartScreen/CartPage.dart';
import 'package:app_e_ecommerce/View/CartScreen/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Product> cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      if (!cartItems.contains(product)) {
        cartItems.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Center(

          child: Text(
            languageProvider.currentLocale.languageCode == 'en'
                                    ? " App E-Commerce"
                                    : "تطبيق التجارة الإلكترونية",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
              ),
            ),

        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: cartItems),
                    ),
                  );
                },
              ),

              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),

                    child: Text(
                      '${cartItems.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ProductPage(
        onAddToCart: _addToCart
        ),
    );
  }
}
