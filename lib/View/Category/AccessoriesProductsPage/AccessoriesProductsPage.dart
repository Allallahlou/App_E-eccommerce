import 'package:app_e_ecommerce/View/Category/CategoryScreen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:flutter/material.dart';

class AccessoriesProductsPage extends StatelessWidget {
  AccessoriesProductsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> accessoriesProducts = [
    {
      'name': 'elegant cap',
      'image': 'images/ggg.png',
      'price': 29.99,
    },
    {
      'name': 'Stylish metal bracelet',
      'image': 'images/ll.png',
      'price': 39.99,
    },
    {
      'name': 'luxury leather belt',
      'image': 'images/uuu.png',
      'price': 39.99,
    },
    {
      'name': 'leather travel bag',
      'image': 'images/ii.png',
      'price': 49.99,
    },
    {
      'name': 'sports backpack',
      'image': 'images/ooo.png',
      'price': 49.99,
    },
    {
      'name': 'leather handbag',
      'image': 'images/ppp.png',
      'price': 59.99,
    }
  ];

  double getTotalPrice() {
    return accessoriesProducts.fold(
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
          'Accessories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: accessoriesProducts.isEmpty
          ? const Center(
              child: Text(
                'There are currently no products',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: accessoriesProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final accessory = accessoriesProducts[index];
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
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              accessory['image'],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            accessory['name'],
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
                            "${accessory['price']} €",
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
                                  builder: (context) => const PaymentScreen(),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Selected ${accessory['name']} to pay!',
                                  ),
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
      bottomNavigationBar: accessoriesProducts.isEmpty
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
