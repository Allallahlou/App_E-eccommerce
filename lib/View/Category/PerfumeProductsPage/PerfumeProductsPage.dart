// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/Category/CategoryScreen.dart';
import 'package:flutter/material.dart';

class PerfumeProductsPage extends StatelessWidget {
  final perfumesProducts = [
    {
      'name': 'Luxurious Perfume 1',
      'image': 'images/perfume_1.png',
      'price': 120.0,
    },
    {
      'name': 'Luxury Perfume 2',
      'image': 'images/perfume_2.png',
      'price': 180.0,
    },
    {
      'name': 'Elegant Perfume 3',
      'image': 'images/perfume_3.png',
      'price': 150.0,
    },
    {
      'name': 'Exquisite Perfume 4',
      'image': 'images/perfume_4.png',
      'price': 160.0,
    },
    {
      'name': 'Charming Perfume 5',
      'image': 'images/perfume_5.png',
      'price': 140.0,
    },
    {
      'name': 'Exotic Perfume 6',
      'image': 'images/perfume_6.png',
      'price': 130.0,
    },
  ];

  PerfumeProductsPage({Key? key}) : super(key: key);

  double getTotalPrice() {
    return perfumesProducts.fold(
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
        title: const Text("Zairos Perfumes"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: perfumesProducts.isEmpty
          ? const Center(
              child: Text("There are no perfumes currently available."))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65, // More space for image and text
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: perfumesProducts.length,
              itemBuilder: (context, index) {
                final product = perfumesProducts[index];
                final imagePath = product['image'] as String;
                final productName = product['name'] as String;
                final productPrice = product['price'] as double;

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  shadowColor: Colors.black26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: Image.asset(
                          imagePath,
                          height: 160, // Bigger height for image
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Text(
                          productName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "$productPrice €",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Selected $productName To pay"),
                              ),
                            );
                          },
                          icon: const Icon(Icons.payment, size: 18),
                          label: const Text("Pay"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            minimumSize: const Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: perfumesProducts.isEmpty
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
