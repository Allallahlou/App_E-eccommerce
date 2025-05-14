import 'package:flutter/material.dart';

class SubmitProductPage extends StatefulWidget {
  const SubmitProductPage({Key? key}) : super(key: key);

  @override
  _SubmitProductPageState createState() => _SubmitProductPageState();
}

class _SubmitProductPageState extends State<SubmitProductPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  int quantity = 1;
  bool isFavorite = false;

  // هاد ليست باش نخزن المنتجات الجديدة هنا (مؤقتاً)
  final List<Map<String, dynamic>> userAddedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Submit Your Product"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Address / Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: "Image link",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Text('$quantity', style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.green),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.pink,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    imageUrlController.text.isNotEmpty) {
                  setState(() {
                    userAddedProducts.add({
                      'title': titleController.text,
                      'price': priceController.text,
                      'imageUrl': imageUrlController.text,
                      'quantity': quantity,
                      'isFavorite': isFavorite,
                    });
                    titleController.clear();
                    priceController.clear();
                    imageUrlController.clear();
                    quantity = 1;
                    isFavorite = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Product added successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Add Product'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent),
            ),
            const SizedBox(height: 30),
            // عرض المنتجات المضافة مؤقتًا في نفس الصفحة (أو يمكنك تنقل لصفحة أخرى)
            userAddedProducts.isEmpty
                ? const Text('No products added yet.')
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: userAddedProducts.length,
                    itemBuilder: (context, index) {
                      final product = userAddedProducts[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          leading: product['imageUrl'] != null &&
                                  product['imageUrl'].isNotEmpty
                              ? Image.network(
                                  product['imageUrl'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.image_not_supported),
                          title: Text(product['title']),
                          subtitle: Text(
                              'Price: ${product['price']}\nQuantity: ${product['quantity']}'),
                          trailing: Icon(
                            product['isFavorite']
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product['isFavorite']
                                ? Colors.pink
                                : Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
