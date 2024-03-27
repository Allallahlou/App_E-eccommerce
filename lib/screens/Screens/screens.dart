import 'package:app_e_ecommerce/Account/Account%20Informations.dart';
import 'package:app_e_ecommerce/Account/Language.dart';
import 'package:app_e_ecommerce/Account/Notifications.dart';
import 'package:app_e_ecommerce/Account/Offers.dart';
import 'package:app_e_ecommerce/Account/Payment.dart';
import 'package:app_e_ecommerce/screens/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/screens/Item/ItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Account/account_screen.dart';
import '../Cart/cart_screen.dart';
import '../Home/home_screen.dart';
import '../Offers/Offers.dart';

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    CartScreen(),
    const FavoriteScreen(),
    AccountScreen(),
    const OffersScreen(),
    const Language_Informations_Screen(),
    const Notifications_Informations_Screen(),
    const Offers_Informations_Screen(),
    const Payment_Informations_Screen(),
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
                rippleColor: Colors.deepOrange,
                hoverColor: Colors.deepOrange,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration:  const Duration(microseconds: 400),
                tabBackgroundColor: Colors.redAccent,
                color: Colors.black,
                tabs:   const [
                  GButton(icon: Icons.home, text: 'Home'),
                  GButton(icon: Icons.shopping_bag, text: 'Cart'),
                  GButton(icon: Icons.favorite, text: 'Favorite'),
                  GButton(icon: Icons.person, text: 'Account'),
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
