// ignore_for_file: camel_case_types
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
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
          borderRadius: BorderRadius.circular(40),
          // ignore: deprecated_member_use
          splashColor: Colors.orangeAccent.withOpacity(0.7),
          // ignore: deprecated_member_use
          highlightColor: Colors.orangeAccent.withOpacity(0.3),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(30),
              border:
                  Border.all(color: Colors.white, width: 2), // إضافة حد أبيض
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
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
      ],
    );
  }
}
