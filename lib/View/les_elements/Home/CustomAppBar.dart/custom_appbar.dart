// ignore_for_file: camel_case_types
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return AppBar(
      backgroundColor: Colors.grey.shade500,
      centerTitle: true,
      title: Text(
        isEnglish ? "Watch Shop" : "متجر الساعات",
        style: GoogleFonts.adamina(
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: .5,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notification_add, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, '/notifications');
          },
        ),
      ],
    );
  }
}
