import 'package:app_e_ecommerce/View/Account/language_provider/language_provider.dart';
import 'package:app_e_ecommerce/View/les_elements/Favorite/favorite_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../les_elements/Item/ItemScreen.dart';

class GridItems extends StatelessWidget {

  var pNames = [
    "Irony_pour_homme",
    "Unisex_Chronographe_Quartz",
    "Analogique",
    "YWS420G_Menichelli",
    "Mens_Swiss_SY23S413",
    "Mens_Irony_Chronograph",
    "Swatchour_YVS426G",
    "SYXG110G",
    "Bijoux_Jewelry",
    "Hombre_Irony_Xlite_Red_Attack",
    "YCS590G",
    "Irony_Chrono_New_YVB416_bonfire",
  ];

  GridItems (int index, {Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
      final languageProvider = Provider.of<LanguageProvider>(context);

    return GridView.builder(
      
        itemCount: pNames.length,
        physics:  const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
        ),

        itemBuilder: (context, index) {
          return Container(
            margin:  const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade400,
              boxShadow:  const [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding:  const EdgeInsets.all(10),
              child: Column(
                children: [
                  
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                       Text(
                           languageProvider.currentLocale.languageCode == 'en'
                                    ? " 30% off"
                                    : " خصم 30%",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      
                      FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print(Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  FavoritesScreen()
                                ),
                                ),
                                ); }
                  }
                  ),
                    ],
                  ),

                  

                  Padding(
                    padding:  const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                  const ItemScreen()
                                  ),
                                  );
                      },
                      child: Image.asset(
                        "images/${pNames[index]}.png",
                        height: 181,
                        width: 181,
                      ),
                    ),
                  ),

                   

                  Padding(
                    padding:  const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pNames[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                         
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        );
  }
}
