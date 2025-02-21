import 'package:flutter/material.dart';

class OrdersPaymentSettingsScreen extends StatefulWidget {
  const OrdersPaymentSettingsScreen({Key? key}) : super(key: key);

  @override
  _OrdersPaymentSettingsScreenState createState() => _OrdersPaymentSettingsScreenState();
}

class _OrdersPaymentSettingsScreenState extends State<OrdersPaymentSettingsScreen> {
  // خيارات الدفع المتاحة
  List<String> paymentMethods = ["Cash on Delivery", "Credit/Debit Card", "PayPal", "Apple Pay"];
  String selectedPaymentMethod = "Cash on Delivery";

  // حالة الطلب
  String orderStatus = "Processing";
  List<String> orderStatuses = ["Processing", "Shipped", "Delivered"];

  // إعدادات الفواتير
  bool sendInvoiceByEmail = true;
  bool allowDownloadReceipt = true;

  // إعدادات الإرجاع والاستبدال
  String returnPolicy = "Returns accepted within 14 days.";
  String exchangeConditions = "Exchange allowed only for defective items.";

  // تحديث حالة الطلب
  void _updateOrderStatus(String newStatus) {
    setState(() {
      orderStatus = newStatus;
    });
  }

  // تحديث سياسة الإرجاع أو الاستبدال
  void _showEditDialog({required String title, required String value, required Function(String) onSave}) {
    TextEditingController controller = TextEditingController(text: value);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Enter new value"),
          maxLines: 3,
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
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text(
              "Save",
               style: TextStyle(
                color: Colors.white,
                ),
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders & Payment Settings", style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          ),
          ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle("Payment Methods"),
          DropdownButtonFormField<String>(
            value: selectedPaymentMethod,
            items: paymentMethods.map((method) {
              return DropdownMenuItem(value: method, child: Text(method));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),

          _buildSectionTitle("Order Management"),
          DropdownButtonFormField<String>(
            value: orderStatus,
            items: orderStatuses.map((status) {
              return DropdownMenuItem(value: status, child: Text(status));
            }).toList(),
            onChanged: (value) {
              _updateOrderStatus(value!);
            },
          ),

          _buildSectionTitle("Invoice & Receipt Settings"),
          SwitchListTile(
            title: const Text("Send Invoice via Email"),
            value: sendInvoiceByEmail,
            onChanged: (value) {
              setState(() {
                sendInvoiceByEmail = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text("Allow Downloadable Receipts"),
            value: allowDownloadReceipt,
            onChanged: (value) {
              setState(() {
                allowDownloadReceipt = value;
              });
            },
          ),

          _buildSectionTitle("Returns & Exchanges"),
          ListTile(
            title: const Text("Return Policy"),
            subtitle: Text(returnPolicy),
            trailing: const Icon(
              Icons.edit,
              color: Colors.black,
              ),
            onTap: () {
              _showEditDialog(
                title: "Edit Return Policy",
                value: returnPolicy,
                onSave: (val) =>
                 setState(() => returnPolicy = val),
              );
            },
          ),
          ListTile(
            title: const Text("Exchange Conditions"),
            subtitle: Text(exchangeConditions),
            trailing: const Icon(
              Icons.edit,
              color: Colors.black,
              ),
            onTap: () {
              _showEditDialog(
                title: "Edit Exchange Conditions",
                value: exchangeConditions,
                onSave: (val) =>
                 setState(() => exchangeConditions = val),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black),),
    );
  }
}
