// ignore_for_file: file_names, camel_case_types, library_private_types_in_public_api

import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/Category/CategoryScreen.dart';
import 'package:app_e_ecommerce/View/Drawer/CustomDrawer.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/CustomAppBar.dart/custom_appbar.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/HomeContent/Home_Content.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/custom_bottom_nav/custom_bottom_nav.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_Screen> {
  final int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Home_Screen(),
    const Card_Screen(),
    const NoificationScreen(),
    const CategoryScreen(),
    const Login_Screen(),
  ];

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _screens[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Custom_AppBar(),
      body: const Home_Content(),
      drawer: const CustomDrawer(),
      bottomNavigationBar: Custom_Bottom_Nav(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
