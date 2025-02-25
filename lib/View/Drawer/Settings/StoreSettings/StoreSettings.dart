// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class StoreSettingsScreen extends StatefulWidget {
  const StoreSettingsScreen({Key? key}) : super(key: key);

  @override
  _StoreSettingsScreenState createState() => _StoreSettingsScreenState();
}

class _StoreSettingsScreenState extends State<StoreSettingsScreen> {
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

  void _addCategory() {
    _showAddDialog(
      title: "Add Category",
      hint: "Enter category name",
      onAdd: (value) => setState(() => categories.add(value)),
    );
  }

  void _addBrand() {
    _showAddDialog(
      title: "Add Brand",
      hint: "Enter brand name",
      onAdd: (value) => setState(() => brands.add(value)),
    );
  }

  void _addDeliveryArea() {
    _showAddDialog(
      title: "Add Delivery Area",
      hint: "Enter area",
      onAdd: (value) => setState(() => deliveryAreas.add(value)),
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
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
        content: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hint, border: const OutlineInputBorder())),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.red))),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Store Settings",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          _buildSectionTitle("Store Information"),
          _buildTextField("Store Name", _storeNameController),
          _buildTextField("Store Description", _storeDescriptionController),
          _buildTextField("Contact Info", _contactController),
          _buildSectionTitle("Categories"),
          _buildList(categories, _addCategory, Icons.category),
          _buildSectionTitle("Brands"),
          _buildList(brands, _addBrand, Icons.star),
          _buildSectionTitle("Shipping & Delivery"),
          ListTile(
            title: const Text("Shipping Cost",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("\$${shippingCost.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16)),
            onTap: () => _showNumberDialog(
              title: "Shipping Cost",
              value: shippingCost,
              onConfirm: (val) => setState(() => shippingCost = val),
            ),
          ),
          _buildList(deliveryAreas, _addDeliveryArea, Icons.location_on),
          _buildSectionTitle("Taxes & Currency"),
          ListTile(
            title: const Text("Tax Rate",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text("$taxRate%", style: const TextStyle(fontSize: 16)),
            onTap: () => _showNumberDialog(
              title: "Tax Rate",
              value: taxRate,
              onConfirm: (val) => setState(() => taxRate = val),
            ),
          ),
          ListTile(
            title: const Text("Currency",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (value) => setState(() => selectedCurrency = value!),
              items: ["USD", "EUR", "MAD"].map((currency) {
                return DropdownMenuItem(value: currency, child: Text(currency));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
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

  Widget _buildList(List<String> items, VoidCallback onAdd, IconData icon) {
    return Column(
      children: [
        ...items.map((item) => ListTile(
              leading: Icon(icon, color: Colors.black),
              title: Text(item),
            )),
        ElevatedButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text("Add", style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        ),
      ],
    );
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
                fontWeight: FontWeight.bold, color: Colors.black)),
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
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
