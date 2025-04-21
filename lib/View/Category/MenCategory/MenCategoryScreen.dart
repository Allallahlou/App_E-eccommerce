import 'package:flutter/material.dart';

class MenCategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menProducts = [
    {
      'name': 'ساعة رجالية فاخرة',
      'price': 149.99,
      'image': 'images/FF.png',
    },
    {
      'name': 'ساعة جلد أنيقة',
      'price': 119.99,
      'image': 'images/eco.png',
    },
    {
      'name': 'ساعة رياضية ذكية',
      'price': 179.99,
      'image': 'images/ecom.png',
    },
    {
      'name': 'ساعة رجالية فاخرة',
      'price': 149.99,
      'image': 'images/FF.png',
    },
    {
      'name': 'ساعة جلد أنيقة',
      'price': 119.99,
      'image': 'images/eco.png',
    },
    {
      'name': 'ساعة رياضية ذكية',
      'price': 179.99,
      'image': 'images/ecom.png',
    },
    // زيد المنتجات هنا بنفس الشكل
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Center(
          child: Text(
            'ساعات رجالية',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: menProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final product = menProducts[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        product['image'],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${product['price']} درهم",
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
