import 'package:flutter/material.dart';

class DiscountScreen extends StatelessWidget {
  DiscountScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> discountItems = [
    {
      'name': 'ury mens watch',
      'image': 'images/watch1.png',
      'price': 200.0,
      'discount': 150.0,
    },
    {
      'name': 'ساعة نسائية أنيقة',
      'image': 'images/watch2.png',
      'price': 180.0,
      'discount': 120.0,
    },
    {
      'name': 'نظارات شمسية',
      'image': 'images/glasses.jpg',
      'price': 80.0,
      'discount': 60.0,
    },
    {
      'name': 'سوار جلدي',
      'image': 'assets/images/bracelet.jpg',
      'price': 40.0,
      'discount': 30.0,
    },
    {
      'name': 'حقيبة يد نسائية',
      'image': 'assets/images/bag_1.jpg',
      'price': 150.0,
      'discount': 110.0,
    },
    {
      'name': 'حقيبة ظهر رجالية',
      'image': 'assets/images/bag_2.jpg',
      'price': 140.0,
      'discount': 90.0,
    },
    {
      'name': 'قبعة صيفية',
      'image': 'assets/images/hat.jpg',
      'price': 30.0,
      'discount': 20.0,
    },
    {
      'name': 'محفظة جلدية',
      'image': 'assets/images/wallet.jpg',
      'price': 60.0,
      'discount': 45.0,
    },
    {
      'name': 'عطر فاخر',
      'image': 'assets/images/perfume.jpg',
      'price': 100.0,
      'discount': 70.0,
    },
    {
      'name': 'سماعات بلوتوث',
      'image': 'assets/images/headphones.jpg',
      'price': 90.0,
      'discount': 65.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Discounts")),
        backgroundColor: Colors.pinkAccent,
      ),
      body: discountItems.isEmpty
          ? const Center(child: Text("There are no discounts currently!"))
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: discountItems.length,
                itemBuilder: (context, index) {
                  final item = discountItems[index];
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
                            item['image'],
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['name'],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(
                                "${item['discount']} €",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "${item['price']} €",
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border,
                                color: Colors.red),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        '${item['name']} تمت إضافته للمفضلة')),
                              );
                            },
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
