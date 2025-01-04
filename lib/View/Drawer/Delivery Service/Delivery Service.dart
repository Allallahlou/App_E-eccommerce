import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/home_scren.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryProfileScreen extends StatelessWidget {
  const DeliveryProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(

          child:Text(
             languageProvider.currentLocale.languageCode == 'en'
                                    ? " Delivery Service"
                                    : "  خدمة التوصيل",
            
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
              ),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, 
            color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // رأس الشاشة مع أيقونات 

            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                 horizontal: 15
                 ),

              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.local_shipping,
                    size: 60,
                    color: Colors.white,
                  ),
                  
                  const SizedBox(height: 10),

                  Text(
                     languageProvider.currentLocale.languageCode == 'en'
                                    ? " Fast & Reliable Delivery"
                                    : "  تسليم سريع وموثوق",
                    
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                     languageProvider.currentLocale.languageCode == 'en'
                                    ? " Get your orders delivered safely and on time to your doorstep."
                                    : "  . احصل على طلباتك بأمان وفي الوقت المحدد إلى باب منزلك ",
                    
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // أقسام الخدمة

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  serviceCard(
                    icon: Icons.access_time,
                    title: languageProvider.currentLocale.languageCode == 'en'
                                    ? " Delivery Time"
                                    : " موعد التسليم ", 
                    description: languageProvider.currentLocale.languageCode == 'en'
                                    ? " Your package will be delivered within 1-2 days for local shipments."
                                    : " سيتم تسليم الطرد الخاص بك خلال 1-2 يومًا للشحنات المحلية. ", 
                  ),
                  const SizedBox(height: 15),
                  serviceCard(
                    icon: Icons.location_on,
                    title:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Coverage Area"
                                    : "  منطقة التغطية",
                    description:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Our service covers over 50 cities across the country."
                                    : "  تغطي خدمتنا أكثر من 50 مدينة في جميع أنحاء البلاد.",
                  ),
                  const SizedBox(height: 15),
                  serviceCard(
                    icon: Icons.support_agent,
                    title:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Customer Support"
                                    : "  دعم العملاء",
                    description:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Available 24/7 to assist you with your delivery inquiries."
                                    : "  متاح على مدار الساعة طوال أيام الأسبوع لمساعدتك في استفسارات التسليم الخاصة بك.",
                  ),
                  const SizedBox(height: 15),
                  serviceCard(
                    icon: Icons.security,
                    title:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Safe Handling"
                                    : "  التعامل الآمن",
                    description:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " We ensure your packages are handled with utmost care and security."
                                    : " نحن نضمن أن يتم التعامل مع الطرود الخاصة بك بأقصى درجات العناية والأمان. ",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // تتبع التوصيل

            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                   Text(
                     languageProvider.currentLocale.languageCode == 'en'
                        ? " LogTrack Your Deliveryin"
                        : "تتبع تسليمك",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 10),

                   Text(
                     languageProvider.currentLocale.languageCode == 'en'
                       ? " Enter your tracking ID below to get the latest updates on your shipment."
                       : "  أدخل معرف التتبع الخاص بك أدناه للحصول على آخر التحديثات المتعلقة بشحنتك.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 15),
                  
                  TextField(
                    decoration: InputDecoration(
                      hintText:  languageProvider.currentLocale.languageCode == 'en'
                                    ? " Enter Tracking ID"
                                    : "  أدخل معرف التتبع",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.teal,
                          ),
                      ),

                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.teal),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      // Add tracking functionality
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    child:  Text(
                       languageProvider.currentLocale.languageCode == 'en'
                                    ? " Track Now"
                                    : "  تتبع الآن",
                    
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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

  // ويدجت لعرض بطاقة الخدمة

  Widget serviceCard(
    {
    required IconData icon,
    required String title,
    required String description,
  }
  )

   {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.teal.shade100,
            child: Icon(
              icon, size: 30,
              color: Colors.teal,
              ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 5),
                
                Text(
                  description,
                  style: const TextStyle(
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
