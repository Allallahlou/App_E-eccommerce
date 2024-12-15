import 'package:app_e_ecommerce/View/les%20elements/Home/home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the App'),
        centerTitle: true,
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/yy.png',   
                height: 400,
                width: 900,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
             Center(
              child:  Text(

            "Welcome to this app for selling watches!",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.green.shade400,
                letterSpacing:.5
                ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Center(
              child: Center(
                child:Text(
  "Welcome, thank you for choosing our app to buy your luxury watches. "
  "Whether you are looking for luxury, classic, or modern watches, our app is the perfect platform for all your needs. "
  "Our store offers a curated collection of premium watches, designed to cater to every style and need. "
  "Whether you're looking for a timeless classic or a modern masterpiece, we have something for everyone. "
  "Here's what makes our watches exceptional:\n\n"
  
  "1. Luxury Watches:\n"
  "   + Sophisticated designs from leading global brands.\n"
  "   + Crafted with high-quality materials such as sapphire crystal, stainless steel, and genuine leather.\n"
  "   + Perfect for formal occasions or as a status symbol.\n\n"
  
  "2. Smartwatches:\n"
  "   + Featuring the latest technology with fitness tracking, notifications, and customizable watch faces.\n"
  "   + Compatible with Android and iOS devices.\n"
  "   + Ideal for tech-savvy individuals who want functionality with style.\n\n"
  
  "3. Casual and Everyday Watches:\n"
  "   + Comfortable, lightweight, and durable designs.\n"
  "   + A variety of colors and straps to match your daily outfits.\n"
  "   + Affordable options for a stylish yet practical choice.\n\n"
  
  "4. Sports Watches:\n"
  "   + Water-resistant and shock-proof designs for active lifestyles.\n"
  "   + Equipped with features like a stopwatch, altimeter, and GPS tracking.\n"
  "   + Designed for athletes and outdoor enthusiasts.\n\n"
  
  "5. Vintage and Collectors Watches:\n"
  "   + Unique, rare designs for watch enthusiasts and collectors.\n"
  "   + A blend of history and craftsmanship.\n"
  "   + Perfect for those who appreciate the art of watchmaking.\n\n"
  
  "Each watch in our collection comes with a guarantee of authenticity and exceptional quality. "
  "Explore our range today and find the perfect timepiece to complement your personality and lifestyle.",
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.black,
            ),
            ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const FeatureItem(
              icon: Icons.shopping_bag,
              title: 'Wide Collection of Watches',
              description:
                  'Browse through a variety of premium watches from top brands and sellers.',
            ),
            const FeatureItem(
              icon: Icons.sell,
              title: 'Easy Selling',
              description:
                  'List your own watches for sale with just a few taps and reach a wide audience.',
            ),
            const FeatureItem(
              icon: Icons.star_rate,
              title: 'Customer Reviews',
              description:
                  'Read reviews from previous buyers to help you make informed decisions.',
            ),
            const FeatureItem(
              icon: Icons.language,
              title: 'Multiple Languages',
              description:
                  'Switch between languages to use the app comfortably in your preferred language.',
            ),
            const FeatureItem(
              icon: Icons.lock,
              title: 'Secure Transactions',
              description:
                  'Enjoy a safe and secure buying experience with protected payment methods.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Why choose our app?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We are committed to providing a seamless and reliable platform for buying watches."
              " Our intuitive interface and advanced features ensure that you have a pleasant experience every time you use our app.",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) =>
                     const HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Start Exploring',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 28,
            color: Colors.green,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    height: 1.4,
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
