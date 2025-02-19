import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_e_ecommerce/View/language/language_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(
            isEnglish ? "Settings" : "إعدادات",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان قسم الحساب
            Text(
              isEnglish ? "Account Settings" : "إعدادات الحساب",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            _buildSettingsOption(
              icon: Icons.person,
              text: isEnglish ? "Profile" : " المعلومات الشخصية",
              onTap: () {
                // توجيه المستخدم إلى شاشة  الحساب
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            // زر تحديث المعلومات الشخصية
            _buildSettingsOption(
              icon: Icons.person,
              text: isEnglish ? "Update Profile" : "تحديث المعلومات الشخصية",
              onTap: () {
                // توجيه المستخدم إلى شاشة تحديث الحساب
              },
            ),

            // زر تغيير كلمة المرور
            _buildSettingsOption(
              icon: Icons.lock,
              text: isEnglish ? "Change Password" : "تغيير كلمة المرور",
              onTap: () {
                // توجيه المستخدم إلى شاشة تغيير كلمة المرور
              },
            ),

            // زر حذف الحساب
            _buildSettingsOption(
              icon: Icons.delete_forever,
              text: isEnglish ? "Delete Account" : "حذف الحساب",
              onTap: () {
                // تأكيد وحذف الحساب
              },
            ),

            const SizedBox(height: 20),

            // عنوان قسم إدارة الصلاحيات
            Text(
              isEnglish ? "User Permissions" : "إدارة الصلاحيات",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // زر إضافة مستخدم جديد
            _buildSettingsOption(
              icon: Icons.group_add,
              text: isEnglish ? "Add New User" : "إضافة مستخدم جديد",
              onTap: () {
                // فتح شاشة إضافة مستخدم بصلاحيات معينة
              },
            ),

            // زر إدارة المستخدمين الحاليين
            _buildSettingsOption(
              icon: Icons.manage_accounts,
              text: isEnglish ? "Manage Users" : "إدارة المستخدمين",
              onTap: () {
                // فتح شاشة إدارة المستخدمين
              },
            ),
          ],
        ),
      ),
    );
  }

  // عنصر لكل خيار في قائمة الإعدادات
  Widget _buildSettingsOption(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.orangeAccent,
        ),
        title: Text(text),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
