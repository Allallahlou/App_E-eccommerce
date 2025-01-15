import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarDropdownPage extends StatelessWidget {
  const AppBarDropdownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final languageProvider = Provider.of<LanguageProvider>(context);

    return  Scaffold(
      appBar: AppBar(
        title:  Text(
          languageProvider.currentLocale.languageCode == 'en'
                                    ? " AppBar with Dropdown"
                                    : "  شريط التطبيقات مع القائمة المنسدلة",
          ),
        actions: [
          DropdownButton<String>(
            underline: Container(),
            icon: const Icon(Icons.more_vert, color: Colors.white),
            items:  [
              DropdownMenuItem(
                value: 'men',
                child: Text(
                  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Men's category  "
                                    : " فئة الرجال",
                  ),
              ),
              DropdownMenuItem(
                value: 'women',
                child: Text(
                   languageProvider.currentLocale.languageCode == 'en'
                                    ? " Women's category  "
                                    : " فئة النساء",
                  ),
              ),
              DropdownMenuItem(
                value: 'children',
                child: Text(
                   languageProvider.currentLocale.languageCode == 'en'
                                    ? "Children's category "
                                    : "فئة الأطفال",
                  ),
              ),
              DropdownMenuItem(
                value: 'girls',
                child: Text(
                   languageProvider.currentLocale.languageCode == 'en'
                                    ? "Girls category "
                                    : "فئة البنات ",
                ),
              ),
              DropdownMenuItem(
                value: 'sportsWatches',
                child: Text(
                    languageProvider.currentLocale.languageCode == 'en'
                                    ? "Sports Watches Category "
                                    : "فئة الساعات الرياضية  ",
                  ),
              ),
              DropdownMenuItem(
                value: 'workWatches',
                child: Text(
                   languageProvider.currentLocale.languageCode == 'en'
                                    ? "Working hours "
                                    : "الساعات العمل     ",
                  ),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(category: value),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body:  Center(
        child: Text(
           languageProvider.currentLocale.languageCode == 'en'
                                    ? " Select a category from the top menu. "
                                    : "اختر فئة من القائمة العلوية",
          ),
      ),
    );
  }
}

// صفحة الفئة المختارة
class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Text(
           languageProvider.currentLocale.languageCode == 'en'
                                    ? "   Category Page: $category"
                                    : " صفحة الفئة: $category",
         ),
      ),
    );
  }
}