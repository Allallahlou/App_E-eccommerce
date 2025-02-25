// ignore_for_file: file_names

import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class AppRatingScreen extends StatelessWidget {
  const AppRatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            languageProvider.currentLocale.languageCode == 'en'
                ? " Help Screen"
                : " شاشة المساعدة",
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 380),
            Center(
              child: Text(
                languageProvider.currentLocale.languageCode == 'en'
                    ? " How was your experience with our app?"
                    : "كيف كانت تجربتك مع تطبيقنا؟",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                debugPrint('Rating: $rating');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action when submitted
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      languageProvider.currentLocale.languageCode == 'en'
                          ? " Thank you for your feedback!"
                          : "! شكرا لتعليقاتك  ",
                    ),
                  ),
                );
              },
              child: Text(
                languageProvider.currentLocale.languageCode == 'en'
                    ? " Submit Feedback"
                    : "  إرسال التعليقات",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
