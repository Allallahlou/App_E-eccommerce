// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ProductInventorySettingsScreen extends StatefulWidget {
  const ProductInventorySettingsScreen({Key? key}) : super(key: key);

  @override
  _ProductInventorySettingsScreenState createState() =>
      _ProductInventorySettingsScreenState();
}

class _ProductInventorySettingsScreenState
    extends State<ProductInventorySettingsScreen> {
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productStockController = TextEditingController();

  List<String> products = [];
  bool lowStockAlert = true;
  double stockLimit = 5.0;
  double discountPercentage = 0.0;
  String promoCode = "SUMMER2025";

  void _addProduct() {
    if (_productNameController.text.isNotEmpty &&
        _productPriceController.text.isNotEmpty &&
        _productStockController.text.isNotEmpty) {
      setState(() {
        products.add(_productNameController.text);
      });
      _clearFields();
    }
  }

  void _clearFields() {
    _productNameController.clear();
    _productDescriptionController.clear();
    _productPriceController.clear();
    _productStockController.clear();
  }

  void _showNumberDialog(
      {required String title,
      required double value,
      required Function(double) onConfirm}) {
    TextEditingController controller =
        TextEditingController(text: value.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent,
            )),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: "Enter value", border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.red))),
          ElevatedButton(
            onPressed: () {
              onConfirm(double.tryParse(controller.text) ?? value);
              Navigator.pop(context);
            },
            child: const Text("Save",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Inventory Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          _buildSectionTitle("Add Product"),
          _buildTextField("Product Name", _productNameController),
          _buildTextField("Description", _productDescriptionController),
          _buildTextField("Price", _productPriceController),
          _buildTextField("Stock Quantity", _productStockController),
          ElevatedButton(
            onPressed: _addProduct,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: const Text("Add Product",
                style: TextStyle(color: Colors.white)),
          ),
          _buildSectionTitle("Inventory Management"),
          SwitchListTile(
            title: const Text("Low Stock Alert",
                style: TextStyle(fontWeight: FontWeight.bold)),
            value: lowStockAlert,
            onChanged: (bool value) {
              setState(() {
                lowStockAlert = value;
              });
            },
          ),
          ListTile(
            title: const Text("Stock Alert Limit",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing:
                Text("$stockLimit items", style: const TextStyle(fontSize: 16)),
            onTap: () => _showNumberDialog(
              title: "Stock Alert Limit",
              value: stockLimit,
              onConfirm: (val) => setState(() => stockLimit = val),
            ),
          ),
          _buildSectionTitle("Discounts & Promotions"),
          ListTile(
            title: const Text("Discount Percentage",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("$discountPercentage%",
                style: const TextStyle(fontSize: 16)),
            onTap: () => _showNumberDialog(
              title: "Discount Percentage",
              value: discountPercentage,
              onConfirm: (val) => setState(() => discountPercentage = val),
            ),
          ),
          ListTile(
            title: const Text("Promo Code",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(promoCode, style: const TextStyle(fontSize: 16)),
            onTap: () {
              _showAddDialog(
                title: "Set Promo Code",
                hint: "Enter promo code",
                onAdd: (value) => setState(() => promoCode = value),
              );
            },
          ),
          _buildSectionTitle("Product List"),
          ...products.map((product) => ListTile(title: Text(product))),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        ),
      ),
    );
  }

  void _showAddDialog(
      {required String title,
      required String hint,
      required Function(String) onAdd}) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onAdd(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Add",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
