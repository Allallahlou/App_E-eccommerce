import 'package:flutter/material.dart';

class BagsProductsPage extends StatelessWidget {
  BagsProductsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> bagsProducts = [
    {
      'name': 'حقيبة نسائية أنيقة',
      'image': 'assets/images/bag_1.jpg',
      'price': 120.0,
    },
    {
      'name': 'حقيبة يد فاخرة',
      'image': 'assets/images/bag_2.jpg',
      'price': 180.0,
    },
    {
      'name': 'حقيبة نسائية أنيقة',
      'image': 'assets/images/bag_1.jpg',
      'price': 120.0,
    },
    {
      'name': 'حقيبة يد فاخرة',
      'image': 'assets/images/bag_2.jpg',
      'price': 180.0,
    },
    // أضف المزيد من المنتجات هنا...
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
          "الحقائب",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: bagsProducts.isEmpty
          ? const Center(
              child: Text(
                "لا توجد حقائب حالياً",
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
                  childAspectRatio: 0.7,
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
                      children: <Widget>[
                        // 1. الصورة تأخذ المساحة المتبقية
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
                        // 2. اسم المنتج
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
                        // 3. السعر
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
