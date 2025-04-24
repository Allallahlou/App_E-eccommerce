import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';
import 'package:flutter/material.dart';

class DiscountScreen extends StatelessWidget {
  DiscountScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> discountItems = [
    {
      'name': 'Luxury men\'s watch',
      'image': 'images/watch1.png',
      'price': 200.0,
      'discount': 150.0,
    },
    {
      'name': 'Elegant women\'s watch',
      'image': 'images/watch2.png',
      'price': 180.0,
      'discount': 120.0,
    },
    {
      'name': 'Sunglasses',
      'image': 'images/glasses.png',
      'price': 80.0,
      'discount': 60.0,
    },
    {
      'name': 'Ride fast bracelet',
      'image': 'images/bracelet.png',
      'price': 40.0,
      'discount': 30.0,
    },
    {
      'name': 'Women\'s handbag',
      'image': 'images/bag_1.png',
      'price': 150.0,
      'discount': 110.0,
    },
    {
      'name': 'Men\'s Backpack',
      'image': 'images/bag_2.png',
      'price': 140.0,
      'discount': 90.0,
    },
    {
      'name': 'Summer hat',
      'image': 'images/hat.png',
      'price': 30.0,
      'discount': 20.0,
    },
    {
      'name': 'Wallet',
      'image': 'images/wallet.png',
      'price': 60.0,
      'discount': 45.0,
    },
    {
      'name': 'Perfume',
      'image': 'images/perfume.png',
      'price': 100.0,
      'discount': 70.0,
    },
    {
      'name': 'Bluetooth headphones',
      'image': 'images/headphones.png',
      'price': 90.0,
      'discount': 65.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home_Screen()),
            );
          },
        ),
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
                  childAspectRatio: 0.65,
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
                          child: Container(
                            height: 160,
                            color: Colors.grey[200],
                            child: Image.asset(
                              item['image'],
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['name'],
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
                                    builder: (context) =>
                                        const PaymentScreen()),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'You selected ${item['name']} to pay!'),
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
    );
  }
}
