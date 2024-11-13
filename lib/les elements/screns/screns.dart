import 'package:app_e_ecommerce/Account/Language.dart';
import 'package:app_e_ecommerce/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/Drawer/Notification.dart';
import 'package:app_e_ecommerce/les%20elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/les%20elements/Home/home_scren.dart';
import 'package:app_e_ecommerce/les%20elements/Login%20Screen/Payements.dart';
import 'package:app_e_ecommerce/les%20elements/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Offers/Offers.dart';

class screes extends StatefulWidget {
  const screes({Key? key}) : super(key: key);

  @override
  State<screes> createState() => _ScreensState();
}

class _ScreensState extends State<screes> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScren(),
    const CartScreen(),
    const FavoriteScreen(),
    login_screen(),
    const OffersScreen(),
    const Language_Information_Screen(),
    const Notification_Screen(),
    const PaymentsScreen(),
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration:  const Duration(microseconds: 400),
                tabBackgroundColor: Colors.pinkAccent,
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
