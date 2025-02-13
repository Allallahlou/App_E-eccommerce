import 'package:app_e_ecommerce/View/Drawer/Settings/SettingsScreen.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/Drawer/App%20Rating/app%20rating.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Share/share.dart';
import 'package:app_e_ecommerce/View/Drawer/Support/Support.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/provider/mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../language/LanguageInfo.dart';
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
              leading: const Icon(
                Icons.brightness_6,
                color: Colors.black,
              ),
              title: Text(
                isEnglish ? "Night mode" : "الوضع الليلي",
              ),
              textColor: Colors.black,
              trailing: Switch(
                value: Provider.of<ModeProvider>(context).lightModeEnable,
                onChanged: (value) {
                  Provider.of<ModeProvider>(context, listen: false).chaneMode();
                },
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.delivery_dining,
                color: Colors.red,
              ),
              title: Text(
                isEnglish ? "Delivery Service" : "خدمة التوصيل",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeliveryProfileScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.pink,
              ),
              title: Text(
                isEnglish ? "Products " : " المنتجات",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.language,
                color: Colors.blue,
              ),
              title: Text(
                isEnglish ? "Language" : "لغة",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LanguageInfoScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.notification_add,
                color: Colors.grey,
              ),
              title: Text(
                isEnglish ? "Notifications" : "إشعارات",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NoificationScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.work,
                color: Colors.cyan,
              ),
              title: Text(
                isEnglish ? "Offers" : "العروض",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Offers_Screen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.payment,
                color: Colors.purple,
              ),
              title: Text(
                isEnglish ? "Payments" : "المدفوعات",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.message,
                color: Colors.green,
              ),
              title: Text(
                isEnglish ? "Chat Server" : "خادم الدردشة",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.share,
                color: Colors.lime,
              ),
              title: Text(
                isEnglish ? "Share" : "مشاركة",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Share_Screen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.reviews_rounded,
                color: Colors.deepOrange,
              ),
              title: Text(
                isEnglish ? "App Rating" : "تقييم التطبيق",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppRatingScreen()),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: Text(
                isEnglish ? "Settings" : "إعدادات",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.help_rounded,
                color: Colors.black,
              ),
              title: Text(
                isEnglish ? "About" : "عن",
              ),
              textColor: Colors.black,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutAppScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                isEnglish ? "Logout" : "تسجيل الخروج",
              ),
              textColor: Colors.black,
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
