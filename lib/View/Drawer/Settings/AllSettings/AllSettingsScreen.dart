// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class AllSettingsScreen extends StatefulWidget {
  const AllSettingsScreen({Key? key}) : super(key: key);

  @override
  _AllSettingsScreenState createState() => _AllSettingsScreenState();
}

class _AllSettingsScreenState extends State<AllSettingsScreen> {
  // Store Settings Controllers and Data
  final _storeNameController = TextEditingController(text: "My Watch Store");
  final _storeDescriptionController =
      TextEditingController(text: "Best luxury and sports watches.");
  final _contactController = TextEditingController(text: "+212 600000000");
  final List<String> categories = ["Smart Watches", "Luxury", "Sports"];
  final List<String> brands = ["Rolex", "Casio", "Fossil"];
  double shippingCost = 10.0;
  List<String> deliveryAreas = ["Casablanca", "Marrakech", "Rabat"];
  String selectedCurrency = "USD";
  double taxRate = 5.0;

  // Product Inventory Settings
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productStockController = TextEditingController();
  List<String> products = [];
  bool lowStockAlert = true;
  double stockLimit = 5.0;
  double discountPercentage = 0.0;
  String promoCode = "SUMMER2025";

  // Helper Dialogs
  void _showAddDialog(
      {required String title,
      required String hint,
      required Function(String) onAdd}) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hint, border: const OutlineInputBorder()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            onPressed: () {
              onAdd(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Add", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showNumberDialog(
      {required String title,
      required double value,
      required Function(double) onConfirm}) {
    TextEditingController controller = TextEditingController(text: value.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Enter value", border: OutlineInputBorder()),
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
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _addProduct() {
    if (_productNameController.text.isNotEmpty &&
        _productPriceController.text.isNotEmpty &&
        _productStockController.text.isNotEmpty) {
      setState(() {
        products.add(_productNameController.text);
      });
      _productNameController.clear();
      _productDescriptionController.clear();
      _productPriceController.clear();
      _productStockController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Settings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle("Store Information"),
          _buildTextField("Store Name", _storeNameController),
          _buildTextField("Store Description", _storeDescriptionController),
          _buildTextField("Contact Info", _contactController),

          _buildSectionTitle("Categories"),
          _buildList(categories, () => _showAddDialog(title: "Add Category", hint: "Enter category", onAdd: (val) => setState(() => categories.add(val))), Icons.category),

          _buildSectionTitle("Brands"),
          _buildList(brands, () => _showAddDialog(title: "Add Brand", hint: "Enter brand", onAdd: (val) => setState(() => brands.add(val))), Icons.star),

          _buildSectionTitle("Shipping & Delivery"),
          ListTile(
            title: const Text("Shipping Cost", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("\$${shippingCost.toStringAsFixed(2)}"),
            onTap: () => _showNumberDialog(title: "Shipping Cost", value: shippingCost, onConfirm: (val) => setState(() => shippingCost = val)),
          ),
          _buildList(deliveryAreas, () => _showAddDialog(title: "Add Area", hint: "Enter area", onAdd: (val) => setState(() => deliveryAreas.add(val))), Icons.location_on),

          _buildSectionTitle("Taxes & Currency"),
          ListTile(
            title: const Text("Tax Rate", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("$taxRate%"),
            onTap: () => _showNumberDialog(title: "Tax Rate", value: taxRate, onConfirm: (val) => setState(() => taxRate = val)),
          ),
          ListTile(
            title: const Text("Currency", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (val) => setState(() => selectedCurrency = val!),
              items: ["USD", "EUR", "MAD"].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
            ),
          ),

          _buildSectionTitle("Add Product"),
          _buildTextField("Product Name", _productNameController),
          _buildTextField("Description", _productDescriptionController),
          _buildTextField("Price", _productPriceController),
          _buildTextField("Stock Quantity", _productStockController),
          ElevatedButton(
            onPressed: _addProduct,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            child: const Text("Add Product", style: TextStyle(color: Colors.white)),
          ),

          _buildSectionTitle("Inventory Management"),
          SwitchListTile(
            title: const Text("Low Stock Alert", style: TextStyle(fontWeight: FontWeight.bold)),
            value: lowStockAlert,
            onChanged: (val) => setState(() => lowStockAlert = val),
          ),
          ListTile(
            title: const Text("Stock Alert Limit", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("$stockLimit items"),
            onTap: () => _showNumberDialog(title: "Stock Alert Limit", value: stockLimit, onConfirm: (val) => setState(() => stockLimit = val)),
          ),

          _buildSectionTitle("Discounts & Promotions"),
          ListTile(
            title: const Text("Discount Percentage", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("$discountPercentage%"),
            onTap: () => _showNumberDialog(title: "Discount Percentage", value: discountPercentage, onConfirm: (val) => setState(() => discountPercentage = val)),
          ),
          ListTile(
            title: const Text("Promo Code", style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(promoCode),
            onTap: () => _showAddDialog(title: "Promo Code", hint: "Enter code", onAdd: (val) => setState(() => promoCode = val)),
          ),

          _buildSectionTitle("Product List"),
          ...products.map((p) => ListTile(title: Text(p))).toList(),
        ],
      ),
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
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildList(List<String> items, VoidCallback onAdd, IconData icon) {
    return Column(
      children: [
        ...items.map((item) => ListTile(
              leading: Icon(icon),
              title: Text(item),
            )),
        ElevatedButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
          label: const Text("Add"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
        ),
      ],
    );
  }
}
