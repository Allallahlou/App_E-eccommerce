import 'package:app_e_ecommerce/View/language/language_provider.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteSearchDelegate extends SearchDelegate {
// Favorite watch list (to try)

  final List<Map<String, String>> favoriteWatches = [
    {
      "image": "Images/Irony_pour_homme.png",
      "name": " Irony Pour Homme",
      "price": "\$220",
    },
    {"image": "Images/YCS590G.png", "name": "YCS590G", "price": "\$280"},
    {"image": "Images/Analogique.png", "name": "Analogique", "price": "\$300"},
    {
      "image": "Images/Bijoux_Jewelry.png",
      "name": "Bijoux Jewelry",
      "price": "\$220"
    },
    {
      "image": "Images/Swatchour_YVS426G.png",
      "name": "Chrono Swatchour YVS426G",
      "price": "\$100"
    },
    {
      "image": "Images/Hombre_Irony_Xlite_Red_Attack.png",
      "name": "Hombre Irony Xlite Red Attack",
      "price": "\$210"
    },
    {
      "image": "Images/Irony_Chrono_New_YVB416_bonfire.png",
      "name": "Irony Chrono New YVB416 ",
      "price": "\$600"
    },
    {
      "image": "Images/Unisex_Chronographe_Quartz.png",
      "name": "Unisex Chronographe Quartz",
      "price": "\$160",
    },
    {
      "image": "Images/Mens_Irony_Chronograph.png",
      "name": "Mens Irony Chronograph ",
      "price": "\$270",
    },
    {
      "image": "Images/Mens_Swiss_SY23S413.png",
      "name": "Mens SwissSY23S413",
      "price": "\$450",
    },
    {
      "image": "Images/Apple_Swatch.png",
      "name": "Apple Swatch",
      "price": "\$204",
    },
    {
      "image": "Images/Apple_Swatch_Black.png",
      "name": "Apple Swatch Black",
      "price": "\$250",
    },
    {
      "image": "Images/Swatchour_YVS426G.png",
      "name": "Swatchour YVS426G",
      "price": "\$310"
    },
    {
      "image": "Images/YWS420G_Menichelli.png",
      "name": "YWS420G Menichelli",
      "price": "\$180"
    },
    {"image": "Images/SYXG110G.png", "name": "SYXG110G", "price": "\$390"},
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
// Icon to delete text inside the search box

    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";

          //Return text to empty
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Back button in search screen

    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);

        // Close the search screen
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    // Search results

    final results = favoriteWatches
        .where(
          (watch) => watch['name']!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return results.isEmpty
        ? Center(
            child: Text(
              languageProvider.currentLocale.languageCode == 'en'
                  ? " No matching results found."
                  : "  لم يتم العثور على نتائج مطابقة",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          )
        : ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final watch = results[index];

              return ListTile(
                leading: Image.asset(watch['image']!),

                // Clock image

                title: Text(watch['name']!),

                // Name of the hour

                subtitle: Text(watch['price']!),

                // Hourly price

                onTap: () {
                  // When clicking on the clock

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentScreen()),
                  );
                },
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Search suggestions as you type

    final suggestions = favoriteWatches
        .where(
          (watch) => watch['name']!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final watch = suggestions[index];

        return ListTile(
          leading: Image.asset(watch['image']!),

          // Clock image

          title: Text(watch['name']!),

          // Name of the hour

          subtitle: Text(watch['price']!),

          // Hourly price

          onTap: () {
            query = watch['name']!;

            // Fill the text with the selected text

            showResults(context);

            // Display results
          },
        );
      },
    );
  }
}
