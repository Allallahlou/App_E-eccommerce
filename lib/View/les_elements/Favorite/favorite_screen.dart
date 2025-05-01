import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteItems;

  const FavoriteScreen(
      {Key? key,
      required this.favoriteItems,
      required Null Function(dynamic item) onRemoveItem})
      : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>> get favoriteItems => widget.favoriteItems;

  void removeItem(Map<String, dynamic> item) {
    setState(() {
      favoriteItems.remove(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Item removed from favorites"),
        duration: Duration(milliseconds: 1500),
      ),
    );
  }

  double getTotal() {
    return favoriteItems.fold(
      0,
      (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Favorites")),
        backgroundColor: Colors.pinkAccent,
      ),
      body: favoriteItems.isEmpty
          ? const Center(child: Text("No favorites yet!"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: favoriteItems.length,
                    itemBuilder: (context, index) {
                      final item = favoriteItems[index];
                      return ListTile(
                        leading: Image.asset(item['image'], width: 50),
                        title: Text(item['name']),
                        subtitle: Text("${item['price']} €"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // زر الحذف
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                removeItem(item);
                              },
                            ),
                            // زر الخلاص (الدفع)
                            IconButton(
                              icon: const Icon(Icons.payments_outlined,
                                  color: Colors.green),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentScreen()));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${getTotal().toStringAsFixed(2)} €",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: favoriteItems.isNotEmpty
                            ? () {
                                // Proceed to pay all
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaymentScreen()));
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          "Proceed To Payment",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
