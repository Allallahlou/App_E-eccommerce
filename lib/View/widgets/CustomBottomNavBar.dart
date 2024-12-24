import 'package:app_e_ecommerce/View/Account/LanguageInfo.dart';
import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/Settings.dart';
import 'package:app_e_ecommerce/View/les%20elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/View/les%20elements/Home/home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Offers/Offers.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key, required Null Function(ThemeMode mode) onThemeChanged, required int selectedIndex, required void Function(int index) onTabChange
    }) 
  : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _ScreensState();
}

class _ScreensState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CardScreen(),
     FavoritesScreen(),
     const Settings_Screen(),
    const Offers_Screen(),
    const LanguageInfoScreen(),
    const NoificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.deepOrangeAccent.withOpacity(0.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding:  const EdgeInsets.symmetric(
                horizontal: 15, vertical: 8,
            ),
            child: GNav(
                rippleColor: Colors.pink,
                hoverColor: Colors.pink,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12
                      ),
                duration:  const Duration(microseconds: 400),
                tabBackgroundColor: Colors.pinkAccent,
                color: Colors.black,
                tabs:   const [
                  GButton(icon: Icons.home, text: 'Home'),
                  GButton(icon: Icons.shopping_bag, text: 'Cart'),
                  GButton(icon: Icons.favorite, text: 'Favorite'),
                  GButton(icon: Icons.settings, text: 'Settings'),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  }
                  );
                }
                ),
          ),
        ),
      ),
    );
  }
}