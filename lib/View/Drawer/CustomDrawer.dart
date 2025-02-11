import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/Drawer/App%20Rating/app%20rating.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Share/share.dart';
import 'package:app_e_ecommerce/View/Drawer/Support/Support.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/provider/mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Account/LanguageInfo.dart';
import '../Login Screen/Payment.dart';
import '../Offers/Offers.dart';
import '../les_elements/Favorite/favorite_screen.dart';
import 'About/About.dart';
import 'Delivery Service/Delivery Service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final bool isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width / 2,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('images/drawer.png'),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                image: DecorationImage(
                  image: AssetImage('images/pex.png'),
                  fit: BoxFit.cover,
                ),
              ),
              accountName: null,
              accountEmail: null,
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: Text(
                isEnglish ? "Night mode" : "الوضع الليلي",
              ),
              trailing: Switch(
                value: Provider.of<ModeProvider>(context).lightModeEnable,
                onChanged: (value) {
                  Provider.of<ModeProvider>(context, listen: false).chaneMode();
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                isEnglish ? "Account" : "حساب",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.delivery_dining),
              title: Text(
                isEnglish ? "Delivery Service" : "خدمة التوصيل",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeliveryProfileScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.production_quantity_limits),
              title: Text(
                isEnglish ? "Product Information" : "معلومات المنتج",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                isEnglish ? "Language" : "لغة",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LanguageInfoScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notification_add),
              title: Text(
                isEnglish ? "Notifications" : "إشعارات",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NoificationScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: Text(
                isEnglish ? "Offers" : "العروض",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Offers_Screen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: Text(
                isEnglish ? "Payments" : "المدفوعات",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: Text(
                isEnglish ? "Chat Server" : "خادم الدردشة",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: Text(
                isEnglish ? "Share" : "مشاركة",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Share_Screen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.reviews_rounded),
              title: Text(
                isEnglish ? "App Rating" : "تقييم التطبيق",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppRatingScreen()),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_rounded),
              title: Text(
                isEnglish ? "About" : "عن",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutAppScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                isEnglish ? "Logout" : "تسجيل الخروج",
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
