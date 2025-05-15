import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/SettingsScreen.dart';
import 'package:app_e_ecommerce/View/Drawer/App%20Rating/app%20rating.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Share/share.dart';
import 'package:app_e_ecommerce/View/Drawer/Support/Support.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:app_e_ecommerce/View/CartScreen/MainPage.dart';
import 'package:app_e_ecommerce/View/Offers/Offers.dart';
import 'package:app_e_ecommerce/View/Drawer/About/About.dart';
import 'package:app_e_ecommerce/View/Drawer/Delivery%20Service/Delivery%20Service.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/provider/mode_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEnglish =
        Provider.of<LanguageProvider>(context).currentLocale.languageCode ==
            'en';
    final darkMode = Provider.of<ModeProvider>(context).lightModeEnable;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("images/drawer.png"),
            ),
            accountName: Text(
              isEnglish ? 'Welcome' : 'مرحباً',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              isEnglish ? 'User Account' : 'حساب المستخدم',
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Toggle Mode
                SwitchListTile(
                  secondary: const Icon(Icons.brightness_6),
                  title: Text(
                    isEnglish ? "Dark Mode" : "الوضع الليلي",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  value: darkMode,
                  onChanged: (value) {
                    Provider.of<ModeProvider>(context, listen: false)
                        .chaneMode();
                  },
                ),
                const Divider(),

                _buildDrawerItem(
                  icon: Icons.delivery_dining,
                  iconColor: Colors.red,
                  title: isEnglish ? "Delivery Service" : "خدمة التوصيل",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DeliveryScreen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.card_travel,
                  iconColor: Colors.deepPurple,
                  title: isEnglish ? "Cart" : "عربة التسوق",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MainPage()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.notification_add,
                  iconColor: Colors.grey,
                  title: isEnglish ? "Notifications" : "الإشعارات",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const NotificationScreen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.work,
                  iconColor: Colors.cyan,
                  title: isEnglish ? "Offers" : "العروض",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Offers_Screen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.payment,
                  iconColor: Colors.purple,
                  title: isEnglish ? "Payments" : "المدفوعات",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PaymentScreen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.message,
                  iconColor: Colors.green,
                  title: isEnglish ? "Chat Server" : "خادم الدردشة",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ChatScreen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.share,
                  iconColor: Colors.lime,
                  title: isEnglish ? "Share" : "مشاركة",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Share_Screen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.reviews_rounded,
                  iconColor: Colors.deepOrange,
                  title: isEnglish ? "App Rating" : "تقييم التطبيق",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AppRatingScreen()),
                  ),
                ),
                const Divider(),

                _buildDrawerItem(
                  icon: Icons.settings,
                  title: isEnglish ? "Settings" : "الإعدادات",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.help_rounded,
                  title: isEnglish ? "About" : "حول التطبيق",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutAppScreen()),
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.logout,
                  title: isEnglish ? "Logout" : "تسجيل الخروج",
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Login_Screen()),
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
