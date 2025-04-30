import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/CartScreen/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  const Custom_AppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';
    String currentLanguage = isEnglish ? 'en' : 'ar';

    return AppBar(
      backgroundColor: Colors.grey.shade500,
      title: Center(
        child: Text(
          isEnglish ? "Watch Shop" : "متجر الساعات",
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
        // السلة
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
          borderRadius: BorderRadius.circular(40),
          splashColor: Colors.orangeAccent.withOpacity(0.7),
          highlightColor: Colors.orangeAccent.withOpacity(0.3),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.7),
                  blurRadius: 15,
                  spreadRadius: 4,
                ),
              ],
            ),
            child:
                const Icon(Icons.shopping_cart, color: Colors.white, size: 20),
          ),
        ),

        // DropdownButton على شكل أيقونة ⋮
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            value: currentLanguage,
            onChanged: (String? newValue) {
              if (newValue != null) {
                languageProvider.setLocale(Locale(newValue));
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text('العربية'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
