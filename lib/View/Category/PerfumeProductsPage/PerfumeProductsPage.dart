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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عطور زايروس"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: perfumesProducts.isEmpty
          ? const Center(child: Text("لا توجد عطور حالياً"))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: perfumesProducts.length,
              itemBuilder: (context, index) {
                final product = perfumesProducts[index];
                final imagePath = product['image'] as String;
                final productName = product['name'] as String;
                final productPrice = product['price'] as double;

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.asset(
                          imagePath,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        child: Text(
                          productName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "$productPrice درهم",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("تم اختيار $productName للدفع"),
                              ),
                            );
                          },
                          icon: const Icon(Icons.payment, size: 18),
                          label: const Text("Pay"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                            minimumSize: const Size.fromHeight(36),
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
    );
  }
}
