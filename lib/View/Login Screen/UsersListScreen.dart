import 'package:flutter/material.dart';

class UsersListScreen extends StatefulWidget {
  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  List<Map<String, String>> users = []; // بيانات المستخدمين بشكل محلي
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    // نحاكي تحميل البيانات من السيرفر
    await Future.delayed(const Duration(seconds: 2));

    // بيانات وهمية محلية
    final fetchedUsers = [
      {
        'firstname': 'Allal',
        'lastname': 'Lahlou',
        'email': 'allal@example.com',
      },
      {
        'firstname': 'Salma',
        'lastname': 'Assalah',
        'email': 'salma@example.com',
      },
      {
        'firstname': 'Ali',
        'lastname': 'Kamal',
        'email': 'ali.kamal@example.com',
      },
    ];

    setState(() {
      users = fetchedUsers;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registered Users')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('First Name')),
                  DataColumn(label: Text('Last Name')),
                  DataColumn(label: Text('Email')),
                ],
                rows: users.map((user) {
                  return DataRow(cells: [
                    DataCell(Text(user['firstname'] ?? '')),
                    DataCell(Text(user['lastname'] ?? '')),
                    DataCell(Text(user['email'] ?? '')),
                  ]);
                }).toList(),
              ),
            ),
    );
  }
}
