import 'package:app_e_ecommerce/api_service/api_service.dart';
import 'package:flutter/material.dart';

class UsersListScreen extends StatefulWidget {
  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  List<dynamic> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final fetchedUsers = await ApiService.getUsers();
    setState(() {
      users = fetchedUsers;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registered Users')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
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
