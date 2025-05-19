// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/Drawer/Settings/AccountSettingsScreen/AccountSettingsScreen.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/OrdersPaymentSettings/OrdersPaymentSettings.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/ProductInventorySettings/ProductInventorySettings.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/StoreSettings/StoreSettings.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/UserManagementPage/UserManagementPage.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/UserRoles/UserRoles.dart';
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // عنوان قسم الحساب
          Text(
            isEnglish ? "Account Settings" : "إعدادات الحساب",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildSettingsOption(
            icon: Icons.person,
            text: isEnglish ? "Profile" : " المعلومات الشخصية",
            onTap: () {
              // توجيه المستخدم إلى شاشة  الحساب
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login_Screen(),
                ),
              );
            },
          ),
          // زر تحديث المعلومات الشخصية
          _buildSettingsOption(
            icon: Icons.update,
            text: isEnglish ? "Account Settings" : "تحديث المعلومات الشخصية",
            onTap: () {
              // توجيه المستخدم إلى شاشة تحديث الحساب
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountSettingsScreen(),
                ),
              );
            },
          ),

          // عنوان قسم إدارة الصلاحيات
          Text(
            isEnglish ? "User Permissions" : "إدارة الصلاحيات",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          // زر إضافة مستخدم جديد
          _buildSettingsOption(
            icon: Icons.group_add,
            text: isEnglish ? "UserManagementPage" : "إضافة مستخدم جديد",
            onTap: () {
              // فتح شاشة إضافة مستخدم بصلاحيات معينة
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserManagementPage(),
                ),
              );
            },
          ),
          // عنوان قسم إدارة الصلاحيات
          Text(
            isEnglish
                ? "User Roles & Permissions"
                : "إدارة الأدوار والصلاحيات للمستخدمين ",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildSettingsOption(
              icon: Icons.manage_accounts,
              text: isEnglish
                  ? "User Roles "
                  : "إدارة الأدوار والصلاحيات للمستخدمين ",
              onTap: () {
                // فتح شاشة إدارة المستخدمين
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserRolesScreen(),
                  ),
                );
              }),
          _buildSettingsOption(
              icon: Icons.store,
              text: isEnglish ? "Store " : " المتجر",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoreSettingsScreen(),
                  ),
                );
              }),
          _buildSettingsOption(
              icon: Icons.inventory,
              text: isEnglish ? "Product Inventory" : " المنتج والمخزون",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProductInventorySettingsScreen(),
                  ),
                );
              }),
          _buildSettingsOption(
              icon: Icons.payment,
              text: isEnglish ? " Orders Payment" : "  الطلبات والدفع ",
              onTap: () {
                //
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPaymentSettingsScreen(),
                  ),
                );
              }),
        ]),
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
          size: 14,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
