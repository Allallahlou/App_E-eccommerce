// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imagePath;
  bool isFavorite;
  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    this.isFavorite = false,
  });
}

class ProductPage extends StatefulWidget {
  final Function(Product) onAddToCart;
  const ProductPage({Key? key, required this.onAddToCart}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Product> products = [
    Product(name: "Analogique", price: 100, imagePath: "images/analogique.png"),
    Product(
        name: "Apple Swatch Black",
        price: 280,
        imagePath: "images/Apple_Swatch_Black.png"),
    Product(
        name: "Apple Swatch", price: 300, imagePath: "images/Apple_Swatch.png"),
    Product(
        name: "Bijoux Jewelry",
        price: 400,
        imagePath: "images/Bijoux_Jewelry.png"),
    Product(
        name: "Hombre Irony Xlite Red Attack",
        price: 160,
        imagePath: "images/Hombre_Irony_Xlite_Red_Attack.png"),
    Product(
        name: "Irony Chrono New YVB416 bonfire",
        price: 250,
        imagePath: "images/Irony_Chrono_New_YVB416_bonfire.png"),
    Product(
        name: "Irony pour homme",
        price: 270,
        imagePath: "images/Irony_pour_homme.png"),
    Product(
        name: "Mens Irony Chronograph",
        price: 320,
        imagePath: "images/Mens_Irony_Chronograph.png"),
    Product(
        name: "Mens Swiss SY23S413",
        price: 220,
        imagePath: "images/Mens_Swiss_SY23S413.png"),
    Product(
        name: "Sport Swatch", price: 145, imagePath: "images/Sport_Swatch.png"),
    Product(
        name: "Swatchour YVS426G",
        price: 305,
        imagePath: "images/Swatchour_YVS426G.png"),
    Product(name: "SYXG110G", price: 245, imagePath: "images/SYXG110G.png"),
    Product(
        name: "Unisex Chronographe Quartz",
        price: 105,
        imagePath: "images/Unisex_Chronographe_Quartz.png"),
    Product(name: "YCS590G", price: 115, imagePath: "images/YCS590G.png"),
    Product(
        name: "YWS420G Menichelli",
        price: 45,
        imagePath: "images/YWS420G_Menichelli.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Image.asset(
              product.imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: product.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  product.isFavorite = !product.isFavorite;
                });
                if (product.isFavorite) {
                  widget.onAddToCart(product);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
