import 'package:app_e_ecommerce/View/CartScreen/CartPage.dart';
import 'package:app_e_ecommerce/View/CartScreen/ProductPage.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Center(

          child: Text(
            "App E-Commerce"
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
