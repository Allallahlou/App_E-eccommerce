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
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.purple, size: 30),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
        ),
      ],
    );
  }
}
