import 'package:app_e_ecommerce/View/Category/AccessoriesProductsPage/AccessoriesProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/BagsProductsPage/BagsProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/DiscountScreen/DiscountScreen.dart';
import 'package:app_e_ecommerce/View/Category/GiftsProductsPage/GiftsProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/KidsProductsPage/KidsProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/PerfumeProductsPage/PerfumeProductsPage.dart';
import 'package:app_e_ecommerce/View/Category/WomensProductsPage/WomensProductsPage.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = [
    "Discounts",
    "Women",
    "Kids",
    "Accessories",
    "Bags",
    "Gifts",
    "Perfumes",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              title: Text(
                category,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.pinkAccent),
              onTap: () {
                if (category == "Discounts") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiscountScreen()));
                } else if (category == "Women") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WomensProductsPage()));
                } else if (category == "Kids") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KidsProductsPage()));
                } else if (category == "Accessories") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccessoriesProductsPage()));
                } else if (category == "Bags") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BagsProductsPage()));
                } else if (category == "Gifts") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GiftsProductsPage()));
                } else if (category == "Perfumes") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PerfumeProductsPage()));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
