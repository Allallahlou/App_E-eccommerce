import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/Drawer/CustomDrawer.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/View/les_elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/CustomAppBar.dart/custom_appbar.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/HomeContent/Home_Content.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/custom_bottom_nav/custom_bottom_nav.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_Screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home_Screen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Card_Screen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FavoritesScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(),
      body: Home_Content(),
      drawer: const CustomDrawer(),
      bottomNavigationBar: Custom_Bottom_Nav(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
