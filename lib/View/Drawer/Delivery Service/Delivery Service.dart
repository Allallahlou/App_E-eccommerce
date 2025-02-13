import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryProfileScreen extends StatelessWidget {
  const DeliveryProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
        title: Center(
          child: Text(
            isEnglish ? " Delivery Service " : " خدمة التوصيل",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent.shade700, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.local_shipping,
                      size: 80, color: Colors.white),
                  const SizedBox(height: 15),
                  Text(
                    isEnglish ? "Fast and safe delivery!" : "توصيل سريع وآمن!",
                    style: GoogleFonts.cairo(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isEnglish
                        ? "Get your orders as quickly and safely as possible!"
                        : "احصل على طلباتك بأسرع وقت وبأقصى أمان!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Service Features
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  serviceCard(
                      Icons.access_time,
                      isEnglish ? "⏳ Delivery date" : "⏳ موعد التسليم",
                      isEnglish
                          ? "Delivery within 24-48 hours locally."
                          : "التوصيل خلال 24-48 ساعة محليًا."),
                  serviceCard(
                      Icons.map,
                      isEnglish ? "🌍 Coverage range" : "🌍 نطاق التغطية",
                      isEnglish
                          ? "The service covers more than 50 cities!"
                          : "تشمل الخدمة أكثر من 50 مدينة!"),
                  serviceCard(
                      Icons.support_agent,
                      isEnglish ? "📞 Customer Support" : "📞 دعم العملاء",
                      isEnglish
                          ? "Available 24/7 to help you!"
                          : "متوفر 24/7 لمساعدتك!"),
                  serviceCard(
                      Icons.security,
                      isEnglish
                          ? "🔒 Protection and Security"
                          : "🔒 حماية وأمان",
                      isEnglish
                          ? "Guarantee your order will be delivered with the utmost care!"
                          : "ضمان تسليم الطلب بأقصى درجات العناية!"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tracking Section
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.shade100.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    isEnglish ? "📍Track your shipment" : "📍 تتبع شحنتك",
                    style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent.shade700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isEnglish
                        ? "Enter tracking number for live updates!"
                        : "أدخل رقم التتبع للحصول على تحديثات مباشرة!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: isEnglish
                          ? "🔢 Enter tracking number"
                          : "🔢 أدخل رقم التتبع",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon:
                          Icon(Icons.search, color: Colors.blueAccent.shade700),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade700,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      isEnglish ? "🔍 Track Now" : "🔍 تتبع الآن",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget serviceCard(IconData icon, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.shade100.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.blueAccent.shade100,
            child: Icon(icon, size: 30, color: Colors.blueAccent.shade700),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.cairo(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.cairo(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
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
