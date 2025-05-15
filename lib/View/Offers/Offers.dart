import 'package:flutter/material.dart';

class Offers_Screen extends StatelessWidget {
  const Offers_Screen({Key? key}) : super(key: key);

  // مثال بيانات عروض
  final List<Map<String, dynamic>> offers = const [
    {
      'image': 'images/Classic_Watch.png',
      'title': 'Classic Watch',
      'price': 120,
      'discount': 20,
    },
    {
      'image': 'images/Luxury_Watch.png',
      'title': 'Luxury Watch',
      'price': 250,
      'discount': 30,
    },
    {
      'image': 'images/Sport_Watch.png',
      'title': 'Sport Watch',
      'price': 90,
      'discount': 10,
    },
    {
      'image': 'images/Elegan_Watch.png',
      'title': 'Elegant Watch',
      'price': 180,
      'discount': 25,
    },
    {
      'image': 'images/Smart_Watch.png',
      'title': 'Smart Watch',
      'price': 150,
      'discount': 15,
    },
    {
      'image': 'images/Fashion_Watch.png',
      'title': 'Fashion Watch ',
      'price': 200,
      'discount': 35,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Offers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: offers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final offer = offers[index];
            final oldPrice = offer['price'];
            final discount = offer['discount'];
            final newPrice = oldPrice - (oldPrice * discount / 100);

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        child: Image.asset(
                          offer['image'],
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '-${offer['discount']}%',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      offer['title'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          '\$${newPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${oldPrice}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 12,
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
