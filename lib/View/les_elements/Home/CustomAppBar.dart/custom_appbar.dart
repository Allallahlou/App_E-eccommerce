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
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.7),
                        blurRadius: 15,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
