import 'package:app_e_ecommerce/View/Category/CategoryScreen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:flutter/material.dart';

class GiftsProductsPage extends StatelessWidget {
  GiftsProductsPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> giftsProducts = [
    {
      'name': 'Gift Box',
      'image': 'images/gift_box_1.png',
      'price': 99.99,
    },
    {
      'name': 'Gift Set 2',
      'image': 'images/gift_set_2.png',
      'price': 129.99,
    },
    {
      'name': 'Gift Set 3',
      'image': 'images/gift_set_3.png',
      'price': 149.99,
    },
    {
      'name': 'Gift Set 4',
      'image': 'images/gift_set_4.png',
      'price': 100.99,
    },
    {
      'name': 'Gift Set 5',
      'image': 'images/gift_set_5.png',
      'price': 149.99,
    },
    {
      'name': 'Gift Set 6',
      'image': 'images/gift_set_6.png',
      'price': 100.99,
    },
    {
      'name': 'Gift Set 7',
      'image': 'images/gift_set_7.png',
      'price': 100.99,
    },
    {
      'name': 'Gift Set 8',
      'image': 'images/gift_set_8.png',
      'price': 100.99,
    },
    {
      'name': 'Gift Set 9',
      'image': 'images/gift_set_9.png',
      'price': 100.99,
    },
    {
      'name': 'Gift Set 10',
      'image': 'images/gift_set_10.png',
      'price': 100.99,
    },
  ];

  double getTotalPrice() {
    return giftsProducts.fold(
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
          'Gifts Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: giftsProducts.isEmpty
          ? const Center(
              child: Text(
                'There are no gifts currently',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: giftsProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final product = giftsProducts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentScreen()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Proceed to pay for ${product['name']}"),
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
      bottomNavigationBar: giftsProducts.isEmpty
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
