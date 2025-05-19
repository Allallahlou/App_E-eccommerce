// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:app_e_ecommerce/View/Category/AccessoriesProductsPage/AccessoriesProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/BagsProductsPage/BagsProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/GiftsProductsPage/GiftsProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/KidsProductsPage/KidsProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/PerfumeProductsPage/PerfumeProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/SubmitProductPage/SubmitProductPage.dart';
import 'package:app_e_ecommerce/View/Category/WomensProductsPage/WomensProductsPage.dart';
import 'package:flutter/material.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      "title": "Women",
      "icon": Icons.woman,
      "color": Colors.pinkAccent,
      "page": WomensProductsPage(),
    },
    {
      "title": "Kids",
      "icon": Icons.child_care,
      "color": Colors.lightBlueAccent,
      "page": KidsProductsPage(),
    },
    {
      "title": "Accessories",
      "icon": Icons.watch,
      "color": Colors.teal,
      "page": AccessoriesProductsPage(),
    },
    {
      "title": "Bags",
      "icon": Icons.shopping_bag,
      "color": Colors.brown,
      "page": BagsProductsPage(),
    },
    {
      "title": "Gifts",
      "icon": Icons.card_giftcard,
      "color": Colors.purpleAccent,
      "page": GiftsProductsPage(),
    },
    {
      "title": "Perfumes",
      "icon": Icons.spa,
      "color": Colors.indigoAccent,
      "page": PerfumeProductsPage(),
    },
    {
      "title": "Add your product",
      "icon": Icons.add_box,
      "color": Colors.orangeAccent,
      "page": const SubmitProductPage(),
    }
  ];

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
              MaterialPageRoute(builder: (context) => const Home_Screen()),
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
            ],
          ),
        ),
      ),
    );
  }
}
