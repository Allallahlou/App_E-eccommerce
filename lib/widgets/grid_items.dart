import 'package:flutter/material.dart';
import '../screens/Item/ItemScreen.dart';

class GridItems extends StatelessWidget {
  var pNames = [
    "Swatch1",
    "Adidas",
    "Casqe",
    "eee",
    "Iphone",
    "mmm",
    "Nike",
    "Swatch3",
    "Swatch4",
    "Swatch",
    "USP",
    "Swatch2",
  ];

  GridItems({Key? key}) : super(key: key);
  

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
              color: Colors.pink,
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
                      )
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
                        height: 75,
                        width: 75,
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
                                fontSize: 15,
                                color: Colors.white,
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
