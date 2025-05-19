// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Share_Screen extends StatelessWidget {
  const Share_Screen({Key? key}) : super(key: key);

  final String appLink = 'https://example.com'; // رابط التطبيق

  void _openSocial(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final isEnglish = languageProvider.currentLocale.languageCode == 'en';

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(isEnglish ? 'Share the app' : 'شارك التطبيق'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        isEnglish
                            ? 'Share the app with your friends and let them win a free watch upon their first login!'
                            : 'شارك التطبيق مع صحابك وخليهم يربحو ساعة مجانية عند أول دخول!',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      QrImageView(
                        data: appLink,
                        version: QrVersions.auto,
                        size: 150.0,
                      ),
                      const SizedBox(height: 20),

                      // زر نسخ الرابط
                      TextButton.icon(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: appLink));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isEnglish
                                  ? 'Link copied!'
                                  : 'تم نسخ الرابط!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        icon: const Icon(Icons.copy, color: Colors.grey),
                        label: Text(
                          isEnglish ? 'Copy Link' : 'نسخ الرابط',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // أزرار التواصل الاجتماعي
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chat,
                                color: Colors.green, size: 30),
                            onPressed: () {
                              _openSocial('https://wa.me/?text=$appLink');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.facebook,
                                color: Colors.blue, size: 30),
                            onPressed: () {
                              _openSocial(
                                  'https://www.facebook.com/sharer/sharer.php?u=$appLink');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.telegram,
                                color: Colors.blueAccent, size: 30),
                            onPressed: () {
                              _openSocial(
                                  'https://t.me/share/url?url=$appLink');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt,
                                color: Colors.purple, size: 30),
                            onPressed: () {
                              _openSocial('https://www.instagram.com');
                            },
                            tooltip: 'Instagram',
                          ),
                          IconButton(
                            icon: const Icon(Icons.videocam,
                                color: Colors.black, size: 30),
                            onPressed: () {
                              _openSocial('https://www.tiktok.com');
                            },
                            tooltip: 'TikTok',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  isEnglish
                      ? 'Every friend who enters through your link, you get extra points 🎁'
                      : 'كل صديق يدخل عبر رابطك، تأخذ نقاط إضافية 🎁',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  isEnglish ? '#Free_Watch' : '#ساعة_فابور',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
