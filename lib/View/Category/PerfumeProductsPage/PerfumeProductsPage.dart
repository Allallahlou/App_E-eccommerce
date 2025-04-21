import 'package:flutter/material.dart';

class PerfumeProductsPage extends StatelessWidget {
  final perfumesProducts = [
    {
      'name': 'عطر فخم 1',
      'image':
          'assets/images/perfume_1.jpg', // تأكد أن الصورة موجودة في هذا المسار
      'price': 120.0,
    },
    {
      'name': 'عطر فاخر 2',
      'image':
          'assets/images/perfume_2.jpg', // تأكد أن الصورة موجودة في هذا المسار
      'price': 180.0,
    },
    // أضف المزيد من المنتجات هنا...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عطور زايروس"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: perfumesProducts.isEmpty
          ? const Center(child: Text("لا توجد عطور حالياً"))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7, // تعديل النسبة بين العرض والطول
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: perfumesProducts.length,
              itemBuilder: (context, index) {
                final product = perfumesProducts[index];

                // تحقق من وجود الصورة
                Object imagePath =
                    product['image'] ?? 'images/default_image.jpg';

                // تحقق من وجود الاسم أو السعر
                Object productName = product['name'] ?? 'منتج غير معروف';
                Object productPrice = product['price'] ?? 0.0;

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  child: Column(
                    children: [
                      Image.asset(
                        imagePath.toString(),
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productName.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "$productPrice €",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.deepPurple,
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
