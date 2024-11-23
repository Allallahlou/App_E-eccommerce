import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  // قائمة تمثل المنتجات في العربة
  final List<Map<String, dynamic>> cartItems = [
    {"image": "images/Irony_pour_homme.png", "name": "Irony Pour Homme", "price": 220, "quantity": 1},
    {"image": "images/YCS590G.png", "name": "YCS590G", "price": 280, "quantity": 1},
    {"image": "images/Analogique.png", "name": "Analogique", "price": 300, "quantity": 1},
     {"image": "images/Apple_Swatch_Black.png", "name": "Apple Swatch Black", "price": 300, "quantity": 1},
      {"image": "images/Unisex_Chronographe_Quartz.png", "name": "Unisex Chronographe Quartz", "price": 160, "quantity": 1},
       {"image": "images/Mens_Swiss_SY23S413.png", "name": "Mens Swiss SY23S413", "price": 450, "quantity": 1},
        {"image": "images/SYXG110G.png", "name": "SYXG110G", "price": 280, "quantity": 1},
         {"image": "images/Sport_Swatch.png", "name": "Sport Swatch", "price": 320, "quantity": 1},
          {"image": "images/Hombre_Irony_Xlite_Red_Attack.png", "name": "Hombre Irony Xlite Red Attack", "price": 220, "quantity": 1},
           {"image": "images/Irony_Chrono_New_YVB416_bonfire.png", "name": "Irony Chrono New YVB416 bonfire", "price": 45, "quantity": 1},
  ];

  // حساب الإجمالي
  double getTotal() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text(" Shopping Cart")),
      ),
      body: Column(
        children: [
          // قائمة الساعات
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // صورة الساعة
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // تفاصيل الساعة
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                   fontWeight: FontWeight.bold,
                                   ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${item['price']} Euro",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                   color: Colors.pinkAccent.shade700,
                                   ),
                              ),
                            ],
                          ),
                        ),
                        // أزرار التحكم في الكمية
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (item['quantity'] > 1) {
                                    item['quantity']--;
                                  }
                                });
                              },
                            ),
                            Text(
                              "${item['quantity']}",
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  item['quantity']++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // عرض الإجمالي وزر الإكمال
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(
                        fontSize: 18,
                         fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${getTotal()} Euro",
                      style: const TextStyle(
                        fontSize: 18,
                         color: Colors.deepOrange,
                         fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ إجراء عند الإكمال
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:  const Text(
                    "Complete the purchase",
                    style: TextStyle(fontSize: 18),
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
