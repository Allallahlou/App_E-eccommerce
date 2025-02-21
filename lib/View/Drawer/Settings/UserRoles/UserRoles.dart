import 'package:flutter/material.dart';

class User {
  String name;
  String email;
  String role;
  List<String> permissions;

  User(
      {required this.name,
      required this.email,
      required this.role,
      required this.permissions});
}

class UserRolesScreen extends StatefulWidget {
  const UserRolesScreen({Key? key}) : super(key: key);

  @override
  _UserRolesScreenState createState() => _UserRolesScreenState();
}

class _UserRolesScreenState extends State<UserRolesScreen> {
  final List<User> users = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedRole = "Seller";
  List<String> _selectedPermissions = [];

  final Map<String, List<String>> rolePermissions = {
    "Seller": ["Add Products", "View Orders"],
    "Employee": ["Manage Users", "View Reports", "Edit Orders"],
  };

  void _addUser() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        users.add(User(
          name: _nameController.text,
          email: _emailController.text,
          role: _selectedRole,
          permissions: _selectedPermissions,
        ));
      });

      _nameController.clear();
      _emailController.clear();
      _selectedRole = "Seller";
      _selectedPermissions = [];

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Added Successfully")));
    }
  }

  void _deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User Deleted Successfully")));
  }

  void _openAddUserDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add User"),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                    validator: (value) => value!.isEmpty ? "Enter name" : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) =>
                        !value!.contains("@") ? "Enter a valid email" : null,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedRole,
                    items: ["Seller", "Employee"].map((role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                    onChanged: (value) {
                      setDialogState(() {
                        _selectedRole = value!;
                        _selectedPermissions = rolePermissions[_selectedRole]!;
                      });
                    },
                    decoration: const InputDecoration(labelText: "Role"),
                  ),
                  const SizedBox(height: 10),
                  const Text("Permissions:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Column(
                    children: rolePermissions[_selectedRole]!.map((perm) {
                      return CheckboxListTile(
                        title: Text(perm),
                        value: _selectedPermissions.contains(perm),
                        onChanged: (bool? value) {
                          setDialogState(() {
                            value == true
                                ? _selectedPermissions.add(perm)
                                : _selectedPermissions.remove(perm);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),
            ElevatedButton(onPressed: _addUser, child: const Text("Add")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Roles & Permissions"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: Text(users[index].name),
              subtitle: Text(
                  "Role: ${users[index].role}\nPermissions: ${users[index].permissions.join(", ")}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteUser(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddUserDialog,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
    );
  }
}
