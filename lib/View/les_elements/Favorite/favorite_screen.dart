import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/les_elements/Favorite/FavoriteSearchDelegate.dart';
import 'package:app_e_ecommerce/View/les_elements/Home/Home_scren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteWatches = [
    {"image": "Images/Analogique.png", "name": "Analogique", "price": "\$100"},
    {
      "image": "Images/Apple_Swatch_Black.png",
      "name": "Apple Swatch Black",
      "price": "\$280"
    },
    {
      "image": "Images/Apple_Swatch.png",
      "name": "Apple Swatch",
      "price": "\$300"
    },
    {
      "image": "Images/Bijoux_Jewelry.png",
      "name": "Bijoux Jewelry",
      "price": "\$400"
    },
    {
      "image": "Images/Hombre_Irony_Xlite_Red_Attack.png",
      "name": "Hombre Irony Xlite Red Attack",
      "price": "\$160"
    },
    {
      "image": "Images/Irony_Chrono_New_YVB416_bonfire.png",
      "name": "Irony Chrono New YVB416 bonfire",
      "price": "\$250"
    },
    {
      "image": "Images/Irony_pour_homme.png",
      "name": "Irony pour homme",
      "price": "\$270"
    },
    {
      "image": "Images/Mens_Irony_Chronograph.png",
      "name": "Mens Irony Chronograph",
      "price": "\$320"
    },
    {
      "image": "Images/Mens_Swiss_SY23S413.png",
      "name": "Mens Swiss SY23S413",
      "price": "\$220"
    },
    {
      "image": "Images/Sport_Swatch.png",
      "name": "Sport Swatch",
      "price": "\$145"
    },
    {
      "image": "Images/Swatchour_YVS426G.png",
      "name": "Swatchour YVS426G",
      "price": "\$305"
    },
    {"image": "Images/SYXG110G.png", "name": "SYXG110G", "price": "\$245"},
    {
      "image": "Images/Unisex_Chronographe_Quartz.png",
      "name": "Unisex Chronographe Quartz",
      "price": "\$105"
    },
    {
      "image": "Images/YWS420G_Menichelli.png",
      "name": "YWS420G Menichelli",
      "price": "\$45"
    },
  ];

  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            languageProvider.currentLocale.languageCode == 'en'
                ? "Favorites"
                : "المفضلة",
            style: GoogleFonts.adamina(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing: .5,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home_Screen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: FavoriteSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: favoriteWatches.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    languageProvider.currentLocale.languageCode == 'en'
                        ? "You haven't added any watches to your favorites yet!"
                        : "لم تقم بإضافة أي ساعات إلى مفضلتك بعد!",
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      languageProvider.currentLocale.languageCode == 'en'
                          ? "Browse the watches"
                          : "تصفح الساعات",
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favoriteWatches.length,
              itemBuilder: (ctx, index) {
                final watch = favoriteWatches[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          watch['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        watch['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(watch['price']),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductInformationScreen(watch: watch),
                            ),
                          );
                        },
                        child: Text(
                          languageProvider.currentLocale.languageCode == 'en'
                              ? "Product Information"
                              : "معلومات المنتج",
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class ProductInformationScreen extends StatelessWidget {
  final Map<String, dynamic> watch;

  const ProductInformationScreen({Key? key, required this.watch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(watch['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(watch['image'], height: 250),
            const SizedBox(height: 20),
            Text(
              watch['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              watch['price'],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
