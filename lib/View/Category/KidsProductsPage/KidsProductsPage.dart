import 'package:flutter/material.dart';

class KidsProductsPage extends StatelessWidget {
  KidsProductsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> kidsProducts = [
    {
      'name': 'ساعة أطفال ملونة',
      'image': 'assets/images/kid_watch_1.png',
      'price': 49.99,
    },
    {
      'name': 'ساعة طفل ذكية',
      'image': 'assets/images/kid_watch_2.png',
      'price': 59.99,
    },
    {
      'name': 'ساعة أطفال ملونة',
      'image': 'assets/images/kid_watch_1.png',
      'price': 49.99,
    },
    {
      'name': 'ساعة طفل ذكية',
      'image': 'assets/images/kid_watch_2.png',
      'price': 59.99,
    },
    {
      'name': 'ساعة أطفال ملونة',
      'image': 'assets/images/kid_watch_1.png',
      'price': 49.99,
    },
    {
      'name': 'ساعة طفل ذكية',
      'image': 'assets/images/kid_watch_2.png',
      'price': 59.99,
    },
    // أضف المزيد من منتجات الأطفال هنا...
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
                  childAspectRatio: 0.7,
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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "\${product['price']} €",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                            ),
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
