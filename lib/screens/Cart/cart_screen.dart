import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  List imagesList = [
    "images/Adidas.png",
    "images/Nike.png",
    "images/Swatch.png",
    "images/Swatch1.png",
    "images/Iphone.png",
    "images/Casqe.png",
    "images/Swatch6.png",
    "images/USP.png"
  ];

  List productTiteles = [
    "ADIDAS",
    "NIKE",
    "SWATCH",
    "SWATCH",
    "IPHONE",
    "CASQE",
    "SWATCH",
    "USP",
  ];

  List prices = [
    "\$33.21",
    "\$23.25",
    "\$200.29",
    "\$300.22",
    "\$400.25",
    "\$36.27",
    "\$100.27",
    "\$13.27",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                    itemCount: imagesList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                splashRadius: 20,
                                activeColor: const Color(0x000000ff),
                                value: true,
                                onChanged: (vol) {}),
                          ],
                        ),
                      );
                    }),
              ),
              Column(
                children: [
                  for(int i=0; i<8; i++)
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 120,
                    width:  MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 248, 248, 248),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width/4,
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4ECF7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: const Padding(
                            padding:
                                 EdgeInsets.only(left: 15,top:20, bottom: 25),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
