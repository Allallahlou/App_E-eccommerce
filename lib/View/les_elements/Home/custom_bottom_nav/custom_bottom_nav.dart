import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType
          .fixed, // تثبيت النصوص عند وجود أكثر من 3 أيقونات
      selectedItemColor: Colors.grey.shade700, // لون العنصر النشط
      unselectedItemColor: Colors.grey.shade700, // لون العناصر غير النشطة
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
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
    );
  }
}
