import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:app_e_ecommerce/View/les%20elements/Home/home_scren.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // قائمة للساعات المضافة إلى السلة
  List<Map<String, dynamic>> cartItems = [
    {"image": "images/Irony_pour_homme.png", "name": "Irony Pour Homme", "price": 220},
    {"image": "images/YCS590G.png", "name": "YCS590G", "price": 280},
    {"image": "images/Analogique.png", "name": "Analogique", "price": 300},
     {"image": "images/Apple_Swatch_Black.png", "name": "Apple Swatch Black", "price": 300},
      {"image": "images/Unisex_Chronographe_Quartz.png", "name": "Unisex Chronographe Quartz", "price": 160},
       {"image": "images/Mens_Swiss_SY23S413.png", "name": "Mens Swiss SY23S413", "price": 450},
        {"image": "images/SYXG110G.png", "name": "SYXG110G", "price": 280},
         {"image": "images/Sport_Swatch.png", "name": "Sport Swatch", "price": 320},
          {"image": "images/Hombre_Irony_Xlite_Red_Attack.png", "name": "Hombre Irony Xlite Red Attack", "price": 220},
           {"image": "images/Irony_Chrono_New_YVB416_bonfire.png", "name": "Irony Chrono New YVB416 bonfire", "price": 45},
  ];

  // دالة لحساب المجموع الكلي
  double calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item["price"];
    }
    return total;
  }

  // دالة لحذف عنصر من السلة
  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Shopping Cart")),
        leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) =>  const HomeScreen(),
          ),
          ); // الرجوع إلى الشاشة السابقة
    },
  ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(item["image"], width: 60, height: 60),
                    title: Text(item["name"]),
                    subtitle: Text("\$${item["price"]}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeFromCart(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$${calculateTotal().toStringAsFixed(2)}", style: const TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // الانتقال إلى شاشة الدفع
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen()));
                  },
                  child: Text("Complete The Purchase "),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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

// شاشة الدفع كتمثيل Placeholder


