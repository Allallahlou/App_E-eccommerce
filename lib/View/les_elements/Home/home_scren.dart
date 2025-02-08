import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/Drawer/CustomDrawer.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/Settings.dart';
import 'package:app_e_ecommerce/View/les_elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/CustomAppBar.dart/CustomAppBar.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/HomeContent/HomeContent.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/custom_bottom_nav/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    FavoritesScreen(),
    const CardScreen(),
    const NoificationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CardScreen()),
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
          MaterialPageRoute(builder: (context) => const Settings_Screen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    List<Color> Cars = [
      const Color.fromARGB(255, 139, 149, 149),
      const Color.fromARGB(255, 139, 149, 149),
      const Color.fromARGB(255, 139, 149, 149),
    ];

    var imageList = [
      "images/Unisex_Chronographe_Quartz.png",
      "images/YWS420G_Menichelli.png",
      "images/Bijoux_Jewelry.png",
    ];

    var iconImageList = [
      "images/SYXG110G.png",
      "images/YCS590G.png",
      "images/Unisex_Chronographe_Quartz.png",
      "images/YWS420G_Menichelli.png",
      "images/Mens_Swiss_SY23S413.png",
      "images/Mens_Irony_Chronograph.png",
      "images/Swatchour_YVS426G.png",
      "images/Irony_pour_homme.png",
      "images/Analogique.png",
      "images/Apple_Swatch_Black.png",
    ];
    return Scaffold(
      appBar: CustomAppBar(), // استدعاء AppBar المخصص
      body: HomeContent(), // استدعاء المحتوى المفصول
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
