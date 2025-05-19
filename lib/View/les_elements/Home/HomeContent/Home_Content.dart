// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
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

    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;

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
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEnglish ? "Welcome To Our Store" : "مرحبا بكم في متجرنا",
                  style: GoogleFonts.adamina(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: screenWidth * 0.055,
                      letterSpacing: .5,
                    ),
                  ),
                ),
                Text(
                  isEnglish ? "Let's shop something" : " دعونا نتسوق شيئا ما ",
                  style: GoogleFonts.adamina(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontSize: screenWidth * 0.055,
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
            padding: EdgeInsets.only(left: screenWidth * 0.04),
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: EdgeInsets.only(right: screenWidth * 0.03),
                    width: screenWidth * 0.75,
                    height: screenHeight * 0.25,
                    decoration: BoxDecoration(
                      color: Crs[i],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isEnglish
                                      ? "30% off on Winter Collection"
                                      : "خصم 30% على مجموعة الشتاء",
                                  style: GoogleFonts.adamina(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: screenWidth * 0.05,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
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
                                        fontSize: screenWidth * 0.045,
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
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Image.asset(
                            imageList[i],
                            height: screenHeight * 0.20,
                            width: screenWidth * 0.35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isEnglish ? "Top Categories" : "أفضل الفئات",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
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
                        builder: (context) => const Card_Screen(),
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

          SizedBox(height: screenHeight * 0.02),

          // الفئات
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: Row(
                children: [
                  for (var i = 0; i < 10; i++)
                    Container(
                      height: 70, // صغرنا شوية الحجم
                      width: 70,
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
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(iconImageList[i]),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.015),

          GridItems(6),
        ],
      ),
    );
  }
}
