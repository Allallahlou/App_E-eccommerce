// ignore_for_file: file_names, library_private_types_in_public_api
import 'package:flutter/material.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  _UserManagementPageState createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<Map<String, String>> users = [
    {"name": "John", "email": "john@example.com", "phone": "1234567890"},
    {"name": "Hassan", "email": "hassan@example.com", "phone": "0687654321"},
    {"name": "Akram", "email": "akram@example.com", "phone": "0622334455"},
    {"name": "Salma", "email": "salma@example.com", "phone": "0687454321"},
  ];

  void _addUser() {
    setState(() {
      users.add({
        "name": _nameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
      });
    });

    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User Added Successfully")),
    );
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User deleted successfully")),
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
                const SnackBar(content: Text("User updated successfully")),
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User Management"),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person_add), text: "Add User"),
              Tab(icon: Icon(Icons.manage_accounts), text: "Manage Users"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Add User
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Please enter a name" : null,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.contains("@")
                          ? null
                          : "Please enter a valid email",
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.length < 10
                          ? "Enter a valid phone number"
                          : null,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.length < 6
                          ? "Password must be at least 6 characters"
                          : null,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _addUser();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          "Add User",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Tab 2: Manage Users
            ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: Text(users[index]["name"]!),
                    subtitle: Text(users[index]["email"]!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editUser(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteUser(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
