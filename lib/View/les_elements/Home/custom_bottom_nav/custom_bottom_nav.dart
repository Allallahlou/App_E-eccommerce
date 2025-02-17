import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Custom_Bottom_Nav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const Custom_Bottom_Nav({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

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
          label: isEnglish ? "Home" : "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart),
          label: isEnglish ? "Cart" : "عربة التسوق",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: isEnglish ? "Favorites" : "المفضلة",
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: isEnglish ? "Account" : "حساب",
        ),
      ],
    );
  }
}
