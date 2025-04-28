import 'package:app_e_ecommerce/View/Category/CategoryScreen.dart';
import 'package:flutter/material.dart';

class BagsProductsPage extends StatelessWidget {
  BagsProductsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> bagsProducts = [
    {
      'name': 'Elegant womens bag',
      'image': 'images/bag_1.png',
      'price': 120.0,
    },
    {
      'name': 'luxury handbag',
      'image': 'images/bag_2.png',
      'price': 180.0,
    },
    {
      'name': 'Stylish backpack',
      'image': 'images/bag_3.png',
      'price': 150.0,
    },
    {
      'name': 'Trendy crossbody bag',
      'image': 'images/bag_4.png',
      'price': 90.0,
    },
    {
      'name': 'Classic tote bag',
      'image': 'images/bag_5.png',
      'price': 110.0,
    },
    {
      'name': 'Chic shoulder bag',
      'image': 'images/bag_6.png',
      'price': 130.0,
    }
  ];

  double getTotalPrice() {
    return bagsProducts.fold(
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
                builder: (context) =>  CategoryScreen(),
              ),
            );
          },
        ),
        title: const Text(
          "Bags",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: bagsProducts.isEmpty
          ? const Center(
              child: Text(
                "There are no bags at the moment",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: bagsProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = bagsProducts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.asset(
                              product['image'],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Selected${product['name']} To pay!'),
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
      bottomNavigationBar: bagsProducts.isEmpty
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
                    'The total:',
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
