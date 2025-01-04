import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          languageProvider.currentLocale.languageCode == 'en'
                                    ? " About the App"
                                    : " حول التطبيق",
          ),
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/yy.png',   
                height: 400,
                width: 900,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

             Center(
              child:  Text(
                
            languageProvider.currentLocale.languageCode == 'en'
                                    ? " Welcome to this app for selling watches!"
                                    : " مرحباً بكم في هذا التطبيق لبيع الساعات! ",

             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.green.shade400,
                letterSpacing:.5
                ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Center(
                child:Text(
                  languageProvider.currentLocale.languageCode == 'en'
  ? "Welcome, thank you for choosing our app to buy your luxury watches. "
    "Whether you are looking for luxury, classic, or modern watches, our app is the perfect platform for all your needs. "
    "Our store offers a curated collection of premium watches, designed to cater to every style and need. "
    "Whether you're looking for a timeless classic or a modern masterpiece, we have something for everyone. "
    "Here's what makes our watches exceptional:\n\n"
  
    "1. Luxury Watches:\n"
    "   + Sophisticated designs from leading global brands.\n"
    "   + Crafted with high-quality materials such as sapphire crystal, stainless steel, and genuine leather.\n"
    "   + Perfect for formal occasions or as a status symbol.\n\n"
  
    "2. Smartwatches:\n"
    "   + Featuring the latest technology with fitness tracking, notifications, and customizable watch faces.\n"
    "   + Compatible with Android and iOS devices.\n"
    "   + Ideal for tech-savvy individuals who want functionality with style.\n\n"
  
    "3. Casual and Everyday Watches:\n"
    "   + Comfortable, lightweight, and durable designs.\n"
    "   + A variety of colors and straps to match your daily outfits.\n"
    "   + Affordable options for a stylish yet practical choice.\n\n"
  
    "4. Sports Watches:\n"
    "   + Water-resistant and shock-proof designs for active lifestyles.\n"
    "   + Equipped with features like a stopwatch, altimeter, and GPS tracking.\n"
    "   + Designed for athletes and outdoor enthusiasts.\n\n"
  
    "5. Vintage and Collectors Watches:\n"
    "   + Unique, rare designs for watch enthusiasts and collectors.\n"
    "   + A blend of history and craftsmanship.\n"
    "   + Perfect for those who appreciate the art of watchmaking.\n\n"
  
    "Each watch in our collection comes with a guarantee of authenticity and exceptional quality. "
    "Explore our range today and find the perfect timepiece to complement your personality and lifestyle." 


    : "مرحبًا بك، شكرًا لك على اختيار تطبيقنا لشراء ساعاتك الفاخرة."
"سواء كنت تبحث عن ساعات فاخرة أو كلاسيكية أو حديثة، فإن تطبيقنا هو المنصة المثالية لجميع احتياجاتك."
"يقدم متجرنا مجموعة مختارة من الساعات الفاخرة، والمصممة لتلبية جميع الأنماط والاحتياجات."
"سواء كنت تبحث عن ساعة كلاسيكية خالدة أو تحفة فنية حديثة، فلدينا ما يناسب الجميع."
"إليك ما يجعل ساعاتنا استثنائية:\n\n"

"1. الساعات الفاخرة:\n"
" + تصميمات متطورة من العلامات التجارية العالمية الرائدة.\n"
" + مصنوعة من مواد عالية الجودة مثل الكريستال الياقوتي والفولاذ المقاوم للصدأ والجلد الأصلي.\n"
" + مثالية للمناسبات الرسمية أو كرمز للمكانة.\n\n"

"2. الساعات الذكية:\n"
" + تتميز بأحدث التقنيات مع تتبع اللياقة البدنية والإشعارات وواجهات الساعة القابلة للتخصيص.\n"
" + متوافقة مع أجهزة Android وiOS.\n"
" + مثالية لـ الأفراد المولعون بالتكنولوجيا والذين يريدون الوظائف مع الأناقة.\n\n"

"3. ساعات كاجوال ويومية:\n"
" + تصميمات مريحة وخفيفة الوزن ومتينة.\n"
" + مجموعة متنوعة من الألوان والأحزمة لتتناسب مع ملابسك اليومية.\n"
" + خيارات ميسورة التكلفة لاختيار أنيق وعملي.\n\n"

"4. ساعات رياضية:\n"
" + تصميمات مقاومة للماء والصدمات لأنماط الحياة النشطة.\n"
" + مزودة بميزات مثل ساعة الإيقاف ومقياس الارتفاع وتتبع نظام تحديد المواقع العالمي (GPS).\n"
" + مصممة للرياضيين وعشاق الأنشطة الخارجية.\n\n"

"5. ساعات قديمة وهواة جمع الساعات:\n"
" + تصميمات فريدة ونادرة لعشاق الساعات وهواة جمعها.\n"
" + مزيج من التاريخ والحرفية.\n"
" + مثالية لأولئك الذين يقدرون فن صناعة الساعات.\n\n"

"تأتي كل ساعة في مجموعتنا مع ضمان الأصالة والجودة الاستثنائية. "
"استكشف مجموعتنا اليوم واعثر على الساعة المثالية لتكمل شخصيتك وأسلوب حياتك.",
                  
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.black,
            ),
            ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
                languageProvider.currentLocale.languageCode == 'en'
                                    ? " Key Features:"
                                    : " المميزات الرئيسية: ",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            FeatureItem(
              icon: Icons.shopping_bag,
              title: languageProvider.currentLocale.languageCode == 'en'
                                    ? "Wide Collection of Watches"
                                    : "تصفح مجموعة متنوعة من الساعات الفاخرة من أفضل العلامات التجارية والبائعين.   ", 
              description:
              languageProvider.currentLocale.languageCode == 'en'
                                    ? "Browse through a variety of premium watches from top brands and sellers."
                                    : "تشكيلة واسعة من الساعات", 
                  
            ),
             FeatureItem(
              icon: Icons.sell,
              title: languageProvider.currentLocale.languageCode == 'en'
                                    ? "Easy Selling"
                                    : "  بيع سهل ",  
              description:
              languageProvider.currentLocale.languageCode == 'en'
                                    ? "List your own watches for sale with just a few taps and reach a wide audience."
                                    : "قم بإدراج ساعاتك الخاصة للبيع ببضع نقرات فقط وقم بالوصول إلى جمهور واسع.",  
            ),
            FeatureItem(
              icon: Icons.star_rate,
              title:languageProvider.currentLocale.languageCode == 'en'
                                    ? "Customer Reviews "
                                    : "بيع سهل ", 
              description:
              languageProvider.currentLocale.languageCode == 'en'
                                    ? "Read reviews from previous buyers to help you make informed decisions."
                                    : "اقرأ تقييمات المشترين السابقين لمساعدتك على اتخاذ قرارات مستنيرة",
                  
            ),
            FeatureItem(
              icon: Icons.language,
              title: languageProvider.currentLocale.languageCode == 'en'
                                    ? "Multiple Languages"
                                    : "لغات متعددة",
              description:
                     languageProvider.currentLocale.languageCode == 'en'
                                    ? "Switch between languages to use the app comfortably in your preferred language."
                                    : " قم بالتبديل بين اللغات لاستخدام التطبيق بشكل مريح باللغة المفضلة لديك.",
            ),
            FeatureItem(
              icon: Icons.lock,
              title: languageProvider.currentLocale.languageCode == 'en'
                                    ? "Secure Transactions"
                                    : "المعاملات الآمنة ",
              description:
              languageProvider.currentLocale.languageCode == 'en'
                                    ? "Enjoy a safe and secure buying experience with protected payment methods."
                                    : "استمتع بتجربة شراء آمنة ومضمونة مع طرق الدفع المحمية",
            ),
            const SizedBox(height: 20),
             Text(
               languageProvider.currentLocale.languageCode == 'en'
                                    ? "Why choose our app?"
                                    : "لماذا تختار تطبيقنا؟",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              languageProvider.currentLocale.languageCode == 'en'
             ? "We are committed to providing a seamless and reliable platform for buying watches."
             " Our intuitive interface and advanced features ensure that you have a pleasant experience every time you use our app."
             : "نحن ملتزمون بتوفير منصة سلسة وموثوقة لشراء الساعات."
             "تضمن واجهتنا البديهية وميزاتنا المتقدمة حصولك على تجربة ممتعة في كل مرة تستخدم فيها تطبيقنا.",
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) =>
                     const HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:Text(
                   languageProvider.currentLocale.languageCode == 'en'
                                    ? "Start Exploring"
                                    : " ابدأ الاستكشاف",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.green,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
