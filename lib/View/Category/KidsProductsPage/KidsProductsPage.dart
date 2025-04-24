import 'package:flutter/material.dart';

class KidsProductsPage extends StatelessWidget {
  KidsProductsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> kidsProducts = [
    {
      'name': 'Colorful childrens watch',
      'image': 'images/kid_watch.png',
      'price': 49.99,
    },
    {
      'name': 'smart kids watch',
      'image': 'images/kid_watchi.png',
      'price': 59.99,
    },
    {
      'name': 'Kids sports watches',
      'image': 'images/kid_watchiii.png',
      'price': 39.99,
    },
    {
      'name': 'Rotary design childrens watch',
      'image': 'images/kid_watchii.png',
      'price': 69.99,
    },
    {
      'name': 'Unique childrens watch',
      'image': 'images/kid_watcho.png',
      'price': 79.99,
    },
    {
      'name': 'Modern design childrens watch',
      'image': 'images/kid_watchoo.png',
      'price': 89.99,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'منتجات الأطفال',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: kidsProducts.isEmpty
          ? const Center(
              child: Text(
                'لا توجد منتجات حالياً',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: kidsProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final product = kidsProducts[index];
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
                              product['image'],
                              width: double.infinity,
                              fit: BoxFit.contain,
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
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size.fromHeight(36),
                            ),
                            onPressed: () {
                              // منطق الدفع
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "تم اختيار ${product['name']} للدفع"),
                                ),
                              );
                            },
                            icon: const Icon(Icons.payment, size: 18),
                            label: const Text("Pay"),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
