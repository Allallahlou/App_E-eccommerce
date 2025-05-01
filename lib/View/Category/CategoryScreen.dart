import 'package:flutter/material.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      "title": "Women",
      "icon": Icons.woman,
      "color": Colors.pinkAccent,
      "page": Placeholder(), // غيّريها بالصفحة المناسبة
    },
    {
      "title": "Kids",
      "icon": Icons.child_care,
      "color": Colors.lightBlueAccent,
      "page": Placeholder(),
    },
    {
      "title": "Accessories",
      "icon": Icons.watch,
      "color": Colors.teal,
      "page": Placeholder(),
    },
    {
      "title": "Bags",
      "icon": Icons.shopping_bag,
      "color": Colors.brown,
      "page": Placeholder(),
    },
    {
      "title": "Gifts",
      "icon": Icons.card_giftcard,
      "color": Colors.purpleAccent,
      "page": Placeholder(),
    },
    {
      "title": "Perfumes",
      "icon": Icons.spa,
      "color": Colors.indigoAccent,
      "page": Placeholder(),
    },
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home_Screen()),
            );
          },
        ),
        title: const Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GridView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => category["page"]),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category["color"],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: category["color"].withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            category["icon"],
                            size: 50,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category["title"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              // واجهة الاقتراح
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "لم تجد الساعة التي أعجبتك؟",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: "العنوان",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "الثمن",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: imageUrlController,
                      decoration: const InputDecoration(
                        labelText: "رابط الصورة",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                        ),
                        Text('$quantity', style: const TextStyle(fontSize: 18)),
                        IconButton(
                          icon:
                              const Icon(Icons.add_circle, color: Colors.green),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
