import 'package:app_e_ecommerce/View/Account/LanguageInfo.dart';
import 'package:app_e_ecommerce/View/Drawer/Delivery%20Service/Delivery%20Service.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Privacy%20Policy/Privacy%20Policy.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/provider/mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text(
          "إعدادات التطبيق"
          ),

        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),
          
          // **تبديل الوضع الليلي**

          ListTile(
            leading: const Icon(
              Icons.brightness_6
              ),

            title: const Text(
              "الوضع الليلي"
              ),

            trailing: Switch(
              value: Provider.of<ModeProvider>(context).lightModeEnable,
              onChanged: (value) {
                Provider.of<ModeProvider>(context, listen: false)
                    .chaneMode(); 
                    // تغيير الوضع
              },
            ),
          ),

          const Divider(),

          // **إعدادات اللغة**
          ListTile(
            leading: const Icon(
              Icons.language
              ),
            title: const Text(
              "تغيير اللغة"
              ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // الانتقال إلى شاشة اختيار اللغة
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguageInfoScreen(),
                ),
              );
            },
          ),

          const Divider(),

          // **إعدادات الإشعارات**
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("إعدادات الإشعارات"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // شاشة إعدادات الإشعارات
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NoificationScreen(),
                ),
              );
            },
          ),

          const Divider(),

          // **إعدادات الخصوصية**
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text("الخصوصية والأمان"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // الانتقال إلى شاشة الخصوصية
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
          ),

          const Divider(),

          // **إعدادات الحساب**
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("إعدادات الحساب"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // الانتقال إلى شاشة إعدادات الحساب
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeliveryProfileScreen(),
                ),
              );
            },
          ),

          const Divider(),

          // **حول التطبيق**
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("حول التطبيق"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "تطبيق بيع الساعات",
                applicationVersion: "1.0.0",
                applicationIcon: Image.asset('images/person.png', width: 50),
                children: const [
                  Text("هذا التطبيق مخصص لبيع الساعات بمختلف أنواعها."),
                  Text("للمزيد من المعلومات، تواصل معنا على البريد الإلكتروني: support@app.com."),
                ],
              );
            },
          ),

          const Divider(),

          // **تسجيل الخروج**
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("تسجيل الخروج"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const login_screen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
