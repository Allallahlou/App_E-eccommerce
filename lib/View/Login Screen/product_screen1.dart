import 'package:flutter/material.dart';

class ProductScreen1 extends StatefulWidget {

  const ProductScreen1({Key? key}) : super(key: key);

  @override
  State<ProductScreen1> createState() => _ProductScreen1State();
}

class _ProductScreen1State extends State<ProductScreen1> {
  List images = [], similarImages = [];
  List<int> colorList = [
    0xFF304882,
    0xFFBB4747,
    0xFFF8C184,
    0xFF5ABE65,
    ];

  int selectedColorIndex = 0 , 
  scrolledImageIndex = 0 , 
  selectedSimilarColorIndex = 0 ;
  int purchaseCount = 1;

  Widget getColors(int index){

    return GestureDetector(
      onTap: (){
        selectedColorIndex = index;
        setState(() {});
      },

      child: Container(

        padding: const EdgeInsets.all(5),
        width: 31,
        height: 31,

        decoration: BoxDecoration(

          border: Border.all(
            color: selectedColorIndex == index
            ? Color(colorList[index])
            :Colors.white,
            width: 1
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(31),
        ),

        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: Color(colorList[index]),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget getSimilarColorImage(int index){
    return GestureDetector(
      onTap: () {
        setState(() {
           selectedSimilarColorIndex = index;
        });
        },

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.only(top: 2,bottom: 2,right: 20),
          width: 100,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFE7EEF8),
                blurRadius: 1,
                offset: Offset(2.6,2.6),
              ),
            ],

            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.5,
              color: selectedColorIndex == index 
              ? Colors.indigo
              : Colors.transparent),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/${similarImages[index]}"),
            ],
          ),
        ),
    );
  } 

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

            backgroundColor: const Color(0x0ff8f8f8),
            body: SafeArea(
              child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Column(
                children: [
              // Custom App Bar

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },

                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE7EEE8),
                            blurRadius: 4,
                            offset: Offset(0.6, 0.7),
                      ),
                    ],

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.keyboard_backspace),
                    ),
                  ),
                  const SizedBox(width: 20),

                    Row(
                      children: [
                        GestureDetector(
                        onTap:(){},
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFE7EEE8),
                                blurRadius: 4,
                                offset: Offset(0.6, 0.7),
                          ),
                        ],

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(Icons.shopping_cart),
                        ),
                        ),
                      ],
                    ),

                  const SizedBox(width: 20),

                  GestureDetector(
                    onTap:(){},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow:  const [
                          BoxShadow(
                            color: Color(0xFFE7EEE8),
                            blurRadius: 4,
                            offset: Offset(0.6, 0.7),
                      ),
                    ],

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.more_vert),
                    ),
                  ),
                    ],
                  ),

                  // Image Show

                  Expanded(child: ListView(
                    children: [
                      const SizedBox(height: 28),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Expanded(
                          flex: 12,
                          child: Stack(
                            children: [
                              Container(height: 220,
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              decoration: BoxDecoration(
                                boxShadow: const [ 
                                  BoxShadow(
                                    color: Color(0xFFE7EEF8),
                              blurRadius:1,
                              offset: Offset(4.6,4.6),
                               ),
                            ],

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            ),
                            child:PageView.builder(
                              itemCount: images.length,
                              controller:
                               PageController(viewportFraction: 0.55),
                              onPageChanged:(i)=> setState(() {

                                selectedSimilarColorIndex = 0 ;
                                purchaseCount = 0 ;
                                scrolledImageIndex = i ;

                              }
                              ),

                              itemBuilder: (_, i){
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Image.asset(
                                    "images/${images[i]}.png",
                                    height: 90,
                                    width: 90,
                                  ),
                                );
                              },
                              ),
                              ),

                              Positioned.directional(
                                end: 15,
                                top: 15,
                                textDirection: TextDirection.ltr,
                                 child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xFFE3EFFE),
                                        blurRadius: 4,
                                        offset: Offset(3.6, 1.7),
                                      ),
                                    ],

                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(Icons.favorite_border),
                                ),
                                ),
                                ),
                            ],
                          ),
                        ),
                            const Expanded(
                            child: SizedBox(child: SizedBox()),
                            ),
                          Expanded(
                            flex: 2,
                            child: Container(
                            height: 220,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFE7EEF8),
                                  blurRadius: 1,
                                  offset: Offset(2.6, 2.6),
                                ),
                              ],

                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(45),
                                bottomLeft: Radius.circular(45),
                              ),
                            ),

                            child: Padding(padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: colorList
                              .asMap()
                              .entries
                              .map((MapEntry map) => getColors(map.key))
                              .toList()
                            ),),
                            ),
                            ),
                      ],
                      ),
                    ],
                  ),
                  ),
                ],
              ),
              ),  
            ),
            );
  }
}