// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEnglish ? "About the App" : "حول التطبيق",
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green.shade700, Colors.green.shade400],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/yy.png',
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      isEnglish
                          ? "Welcome to the ultimate watch-selling platform!"
                          : "مرحباً بكم في أفضل منصة لبيع الساعات!",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFeatureList(isEnglish),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home_Screen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        isEnglish ? "Start Exploring" : "ابدأ الاستكشاف",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureList(bool isEnglish) {
    List<Map<String, dynamic>> features = [
      {
        'icon': Icons.shopping_bag,
        'title': isEnglish
            ? "Discover the world of elegance and sophistication with our luxurious collection of watches!"
            : "اكتشف عالم الأناقة والرقي مع تشكيلتنا الفاخرة من الساعات!",
        'description': isEnglish
            ? "Enjoy a unique experience with the finest watches carefully designed by the best international brands.\n"
                "Each watch is a masterpiece that reflects the quality, luxury, and elegance you deserve.\n"
                "Why choose our collection?\n"
                "- Elegant designs to suit all tastes.\n"
                "- Luxurious materials that ensure\n"
                " durability and high quality.\n"
                "- Trusted international brands.\n"
                "- Safe and easy shopping experience.\n"
                "Start your journey into the world of luxury today!"
            : "استمتع بتجربة فريدة من نوعها مع أرقى الساعات المصممة بعناية فائقة من أفضل العلامات التجارية العالمية.\n"
                "كل ساعة تمثل تحفة فنية تعكس الجودة، الفخامة، والأناقة التي تستحقها.\n\n"
                "لماذا تختار تشكيلتنا؟\n"
                "- تصاميم راقية تناسب جميع الأذواق.\n"
                "- مواد فاخرة تضمن المتانة والجودة العالية.\n"
                "- علامات تجارية عالمية موثوقة.\n"
                "- تجربة شراء آمنة وسهلة.\n\n"
                "ابدأ رحلتك في عالم الفخامة اليوم!",
      },
      {
        'icon': Icons.sell,
        'title': isEnglish ? "Easy Selling" : "بيع سهل",
        'description': isEnglish
            ? "With a few simple steps, you can list your luxury watches on our platform and get in front of thousands of interested buyers. Enjoy a smooth and secure selling experience, with the ability to set prices and communicate directly with customers to get the best deals."
            : "بخطوات بسيطة وسهلة، يمكنك إدراج ساعاتك الفاخرة على منصتنا والظهور أمام آلاف المشترين المهتمين. استمتع بتجربة بيع سلسة وآمنة، مع إمكانية تحديد الأسعار والتواصل مباشرة مع العملاء للحصول على أفضل العروض.",
      },
      {
        'icon': Icons.star_rate,
        'title': isEnglish ? "Customer Reviews" : "تقييمات العملاء",
        'description': isEnglish
            ? "Read authentic reviews before purchasing."
            : "اقرأ تقييمات حقيقية قبل الشراء.",
      },
      {
        'icon': Icons.lock,
        'title': isEnglish ? "Secure Transactions" : "معاملات آمنة",
        'description': isEnglish
            ? "Your payments are protected and secure."
            : "مدفوعاتك محمية وآمنة.",
      },
    ];

    return Column(
      children: features.map((feature) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading:
                Icon(feature['icon'], size: 30, color: Colors.green.shade700),
            title: Text(
              feature['title'],
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            subtitle: Text(
              feature['description'],
              style: GoogleFonts.lato(fontSize: 14, color: Colors.black87),
            ),
          ),
        );
      }).toList(),
    );
  }
}
