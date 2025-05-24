// ignore_for_file: file_names
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(
          isEnglish ? "About the App" : "حول التطبيق",
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5B4FE9),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 260,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF5B4FE9), Color(0xFF9A7CFD)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Lottie.asset(
                    "Json/success.json",
                    height: 180,
                    repeat: true,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
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
                        color: const Color(0xFF3D3D7D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildFeatureList(isEnglish),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home_Screen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.explore),
                      label: Text(
                        isEnglish ? "Start Exploring" : "ابدأ الاستكشاف",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B4FE9),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 6,
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
            ? "Discover elegance and sophistication!"
            : "اكتشف الأناقة والرقي!",
        'description': isEnglish
            ? "Luxury watches by top brands. Elegant designs, high-quality materials, and secure shopping."
            : "ساعات فاخرة من أفضل العلامات. تصاميم راقية، مواد عالية الجودة، وتجربة شراء آمنة.",
      },
      {
        'icon': Icons.sell,
        'title': isEnglish ? "Easy Selling" : "بيع سهل",
        'description': isEnglish
            ? "List your watches and reach buyers easily."
            : "أدرج ساعاتك وتواصل مع المشترين بسهولة.",
      },
      {
        'icon': Icons.star_rate,
        'title': isEnglish ? "Customer Reviews" : "تقييمات العملاء",
        'description': isEnglish
            ? "Check reviews before buying."
            : "اطّلع على التقييمات قبل الشراء.",
      },
      {
        'icon': Icons.lock,
        'title': isEnglish ? "Secure Transactions" : "معاملات آمنة",
        'description': isEnglish
            ? "Your payments and data are protected."
            : "بياناتك ومدفوعاتك آمنة تماماً.",
      },
    ];

    return Column(
      children: features.map((feature) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10),
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(
              feature['icon'],
              size: 30,
              color: const Color(0xFF5B4FE9),
            ),
            title: Text(
              feature['title'],
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3D3D7D),
              ),
            ),
            subtitle: Text(
              feature['description'],
              style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 60);

    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2, size.height - 30);
    final secondControlPoint = Offset(size.width * 3 / 4, size.height - 90);
    final secondEndPoint = Offset(size.width, size.height - 60);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
