import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/CartScreen/MainPage.dart';
import 'package:app_e_ecommerce/View/Drawer/CustomDrawer.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/Settings.dart';
import 'package:app_e_ecommerce/View/les_elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/View/widgets/grid_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            languageProvider.currentLocale.languageCode == 'en'
                ? "Watch Shop"
                : "متجر الساعات",
            style: GoogleFonts.adamina(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: .5,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              child: Icon(
                Icons.shop,
                color: Colors.grey.shade900,
                size: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoificationScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.notification_add_sharp,
                color: Colors.grey.shade900,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 3,
                left: 15,
                right: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageProvider.currentLocale.languageCode == 'en'
                        ? "Welcome To Our Store"
                        : "مرحبا بكم في متجرنا",
                    style: GoogleFonts.adamina(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    languageProvider.currentLocale.languageCode == 'en'
                        ? "Let's shop something"
                        : "  دعونا نتسوق شيئا ما ",
                    style: GoogleFonts.adamina(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        fontSize: 22,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height /
                          4.5, // تكبير الحاوية
                      decoration: BoxDecoration(
                        color: Cars[i],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  languageProvider.currentLocale.languageCode ==
                                          'en'
                                      ? "30% off on Winter Collection"
                                      : "خصم 30% على مجموعة الشتاء",
                                  style: GoogleFonts.adamina(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 21,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CardScreen(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.shop),
                                    label: Text(
                                      languageProvider
                                                  .currentLocale.languageCode ==
                                              'en'
                                          ? "Shop New"
                                          : "تسوق الأن",
                                      style: GoogleFonts.adamina(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.pinkAccent.shade400,
                                          letterSpacing: .5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            imageList[i],
                            height: 200,
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageProvider.currentLocale.languageCode == 'en'
                        ? "Top Categories"
                        : " أفضل الفئات",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesScreen(),
                        ),
                      );
                    },
                    child: Text(
                      languageProvider.currentLocale.languageCode == 'en'
                          ? "See All"
                          : " انظر الكل",
                      style: GoogleFonts.adamina(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent.shade400,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    for (var i = 0; i < 10; i++)
                      Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4ECF7),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black87,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(iconImageList[i]),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GridItems(6),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            backgroundColor: Colors.grey.shade600,
            label: languageProvider.currentLocale.languageCode == 'en'
                ? "Home"
                : "الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: languageProvider.currentLocale.languageCode == 'en'
                ? "Cart"
                : "عربة التسوق",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: languageProvider.currentLocale.languageCode == 'en'
                ? "Favorites"
                : "المفضلة",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: languageProvider.currentLocale.languageCode == 'en'
                ? "Settings"
                : "إعدادات",
          ),
        ],
      ),
    );
  }
}
