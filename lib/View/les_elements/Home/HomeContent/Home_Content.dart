import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/les_elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/View/widgets/grid_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home_Content extends StatelessWidget {
  const Home_Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    List<Color> Crs = [
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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEnglish ? "Welcome To Our Store" : "مرحبا بكم في متجرنا",
                  style: GoogleFonts.adamina(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                      letterSpacing: .5,
                    ),
                  ),
                ),
                Text(
                  isEnglish ? "Let's shop something" : " دعونا نتسوق شيئا ما ",
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
          // العروض
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: MediaQuery.of(context).size.height / 4.5,
                    decoration: BoxDecoration(
                      color: Crs[i],
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
                                isEnglish
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
                                            const Card_Screen(),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.shopping_basket),
                                  label: Text(
                                    isEnglish ? "Shop" : "تسوق الأن",
                                    style: GoogleFonts.abel(
                                      textStyle: TextStyle(
                                        fontSize: 20,
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
                  isEnglish ? "Top Categories" : "أفضل الفئات",
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
                    isEnglish ? "See All" : "انظر الكل",
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
          // الفئات
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
    );
  }
}
