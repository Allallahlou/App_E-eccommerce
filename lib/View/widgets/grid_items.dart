import 'package:app_e_ecommerce/View/les%20elements/Favorite/favorite_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../les elements/Item/ItemScreen.dart';

class GridItems extends StatelessWidget {

  var pNames = [
    "Irony_pour_homme",
    "YCS590G",
    "Unisex_Chronographe_Quartz",
    "YWS420G_Menichelli",
    "Mens_Swiss_SY23S413",
    "Mens_Irony_Chronograph",
    "Swatchour_YVS426G",
    "SYXG110G",
    "Bijoux_Jewelry",
    "Hombre_Irony_Xlite_Red_Attack",
    "Analogique",
    "Irony_Chrono_New_YVB416_bonfire",
  ];

  GridItems (int index, {Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 5,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text(
                        "30% off",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 60,),
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

                  const SizedBox(
                    height: 10,
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
                        height: 120,
                        width: 300,
                      ),
                    ),
                  ),

                   const SizedBox(height: 20),

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
        });
  }
}
