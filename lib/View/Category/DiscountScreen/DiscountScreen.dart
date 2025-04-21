import 'package:flutter/material.dart';

class DiscountScreen extends StatelessWidget {
  final List<Map<String, dynamic>> discountItems;

  const DiscountScreen({Key? key, required this.discountItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تخفيضات (تصل إلى 70%)"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: discountItems.isEmpty
          ? const Center(child: Text("لا توجد تخفيضات حاليا!"))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: discountItems.length,
              itemBuilder: (context, index) {
                final item = discountItems[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(item['image'], height: 150, width: double.infinity, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['name'],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("${item['price']} €", style: TextStyle(fontSize: 14, color: Colors.deepPurple)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.red),
                          onPressed: () {
                            // Add to favorites
                          },
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
