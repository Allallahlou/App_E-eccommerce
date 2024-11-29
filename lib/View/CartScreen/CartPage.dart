import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:flutter/material.dart';
import 'package:app_e_ecommerce/View/CartScreen/ProductPage.dart';

class CartPage extends StatelessWidget {
  final List<Product> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  double getTotalPrice() {
    return cartItems.fold(0, (total, item) => total + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cart")),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty!"))
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
                        title: Text(product.name),
                        subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
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
                          const Text(
                            "Total:",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$${getTotalPrice().toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        ),
                        child: const Text("Proceed to Payment"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
