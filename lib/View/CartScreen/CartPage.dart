import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:flutter/material.dart';
import 'package:app_e_ecommerce/View/CartScreen/ProductPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final List<Product> cartItems;

  const CartPage({
    Key? key,
    required this.cartItems
    }) : super(key: key);

  double getTotalPrice() {
    return cartItems.fold
    (0, (total, item)
     => total + item.price);
  }

  @override
  Widget build(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(

             languageProvider.currentLocale.languageCode == 'en'
              ? "Cart"
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
      ),

      body: cartItems.isEmpty
          ?  Center(
            child: Text(
               languageProvider.currentLocale.languageCode == 'en'
              ? "Your cart is empty!"
              : " !سلة التسوق الخاصة بك فارغة ",
              ),
              )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return ListTile(
                        leading: Image.asset(
                          product.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          product.name
                          ),
                        subtitle: Text(
                          "\$${product.price.toStringAsFixed(2)}"
                          ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            languageProvider.currentLocale.languageCode == 'en'
                            ? "Total"
                            : "مجموع",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                          Text(
                            "\$${getTotalPrice().toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PaymentScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                            ),
                        ),
                        child:  Text(
                           languageProvider.currentLocale.languageCode == 'en'
                            ? "Proceed to Payment"
                            : "انتقل إلى الدفع",
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
