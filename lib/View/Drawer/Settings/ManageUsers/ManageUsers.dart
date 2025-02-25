// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({Key? key}) : super(key: key);

  @override
  _ManageUsersScreenState createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  List<Map<String, String>> users = [
    {"name": "John ", "email": "john@example.com", "phone": "1234567890"},
    {"name": "Hassan", "email": "Hassan@example.com", "phone": "0687654321"},
    {"name": "Akram", "email": "Akram@example.com", "phone": "0622334455"},
    {"name": "Farid", "email": "Farid@example.com", "phone": "0634654890"},
    {"name": "Salma ", "email": "Salma@example.com", "phone": "0687454321"},
    {"name": "Omar", "email": "Omar@example.com", "phone": "062654455"},
    {"name": "Laila", "email": "Laila@example.com", "phone": "0630967890"},
    {"name": "Brahim", "email": "Brahim@example.com", "phone": "06876500921"},
    {"name": "Doae", "email": "Doae@example.com", "phone": "0622339855"},
    {"name": "Kamal", "email": "Kamal@example.com", "phone": "0634657890"},
    {"name": "Rihab", "email": "Rihab@example.com", "phone": "0687654321"},
    {"name": "Jack", "email": "Jack@example.com", "phone": "1122330955"},
  ];

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("User deleted successfully"),
      ),
    );
  }

  void _editUser(int index) {
    TextEditingController nameController =
        TextEditingController(text: users[index]["name"]);
    TextEditingController emailController =
        TextEditingController(text: users[index]["email"]);
    TextEditingController phoneController =
        TextEditingController(text: users[index]["phone"]);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                users[index] = {
                  "name": nameController.text,
                  "email": emailController.text,
                  "phone": phoneController.text,
                };
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(
                  "User updated successfully",
                )),
              );
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Users"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(users[index]["name"]!),
              subtitle: Text(users[index]["email"]!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () => _editUser(index),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => _deleteUser(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
