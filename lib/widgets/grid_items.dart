import 'package:flutter/material.dart';
import '../les elements/Item/ItemScreen.dart';

class GridItems extends StatelessWidget {

  var pNames = [
    "Swatch_Irony_pour_homme",
    "Swatch_YCS_590G",
    "Swatch_Unisex_Chronographe_Quartz",
    "Swatch_YWS420G_Menichelli",
    "SWATCH_MENS_SWISS_SY23S413",
    "SWATCH_MENS_IRONY_CHRONOGRAPH_SS",
    "Swatch_Chrono_Swatchour_YVS426G",
    "SWATCH_SYXG110G",
    "Swatch_Bijoux_Jewelry",
    "Swatch_Hombre_Irony_Xlite_Red_Attack",
    "SWATCH_Analogique",
    "Swatch_Irony_Chrono_New_YVB416_By_the_bonfire",
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        "30% off",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Icon(Icons.favorite,color: Colors.white),
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
                                builder: (context) =>  const ItemScreen()));
                      },
                      child: Image.asset(
                        "images/${pNames[index]}.png",
                        height: 112,
                        width: 600,
                      ),
                    ),
                  ),
                   const SizedBox(height: 15),
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
                         const SizedBox(height: 10),
                        const Row(
                          children:  [
                            Text(
                              "100\$",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
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
