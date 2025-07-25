// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/Category/CategoryScreen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:flutter/material.dart';

class WomensProductsPage extends StatelessWidget {
  WomensProductsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> womenProducts = [
    {
      'name': 'Wonderful womens watch',
      'image': 'images/women_watch_1.png',
      'price': 150.0,
    },
    {
      'name': 'Luxury womens watch',
      'image': 'images/women_watch_2.png',
      'price': 200.0,
    },
    {
      'name': 'Elegant womens watch',
      'image': 'images/women_watch_3.png',
      'price': 120.0,
    },
    {
      'name': 'Modern womens watch',
      'image': 'images/women_watch_4.png',
      'price': 180.0,
    },
    {
      'name': 'Colorful womens watch',
      'image': 'images/women_watch_5.png',
      'price': 110.0,
    },
    {
      'name': 'Womens sports watch',
      'image': 'images/women_watch_6.png',
      'price': 160.0,
    },
    {
      'name': 'Womens leather watch',
      'image': 'images/women_watch_7.png',
      'price': 140.0,
    },
    {
      'name': 'Decorated womens watch',
      'image': 'images/women_watch_8.png',
      'price': 170.0,
    },
  ];

  double getTotalPrice() {
    return womenProducts.fold(
      0,
      (sum, item) => sum + (item['price'] as double),
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              ),
            );
          },
        ),
        title: const Text(
          ' Womens Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: womenProducts.isEmpty
          ? const Center(
              child: Text(
                'There are no products currently available.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: womenProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = womenProducts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${product['price']} €",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              minimumSize: const Size.fromHeight(36),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentScreen()),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      ' Selected ${product['name']} To pay!'),
                                ),
                              );
                            },
                            child: const Text('Pay'),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: womenProducts.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${total.toStringAsFixed(2)} €',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
