import 'package:flutter/material.dart';

// ignore: camel_case_types
class Mon_Profile_Screen extends StatelessWidget {

  const Mon_Profile_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

// This is all about seller information.

    return Scaffold(

     body: Stack(
      children: [
       Image.asset(
        "images/clock.png",
        fit: BoxFit.cover,
        height: size.height,
        width: size.width,
      ),

      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 9,
          vertical: 20,
          ),
       child: Align(
        alignment: Alignment.bottomCenter,
        child:Card(
        shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(15),
        ),

        child:Container(
          height: size.height *0.4,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical:15,
            ),

        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              ),

            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
              children: [
                const CircleAvatar(
                  radius:42,
                  backgroundImage:
                   AssetImage("images/pres.png"),
                   ),
                   Positioned(
                    bottom: 0,
                    right: 0,
                     child: Container(
                      height: 8,
                      width:8,
                      decoration: const BoxDecoration(
                        shape:BoxShape.circle,
                        color:Colors.green,
                         ),
                         child: const Icon(
                          Icons.check,
                          color:Colors.white,
                          size: 20,
                          ),
                         ),
                   ),
              ],
              ),

              Row(
                children: [
                  Text(
                    "Phone:",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.lightBlue.shade900,
                      fontSize: 16),
                      ),
              const SizedBox(width:7.0),
              const Text(
                "0687654532",
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                  ),
                  ),
              ],
              ),
              ],
              ),
              const SizedBox(height: 10),
               const Text(
                "Allal Lahlou",
                style: TextStyle(
                  fontWeight:FontWeight.w800,
                  fontSize: 30,
                  fontStyle: FontStyle.normal
                  ),
              ),
              const Text(
                "SELLER OF ALL WATCHES",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                  color: Color.fromARGB(255, 220, 6, 84),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                    "Welcome to our store! We are delighted to have you here."
                    " As a seller of high-quality watches, "
                    "I am committed to helping you find the perfect piece that suits your style and needs."
                    " Please feel free to browse our collection and don’t hesitate to reach out with any questions."
                    " Thank you for choosing us for your timepiece!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight:FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 13.6,
                ),
              ),
              ],
              ),
            ),
            const Spacer(),
            const Divider(color: Colors.black12,),
            SizedBox(
              height: 65,
               child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  friendAndMore("Product Requests","300"),
                  friendAndMore("Product Purchases","210"),
                  friendAndMore("Remaining Products","70"),
                  const Spacer(),
                ],
                ),
                ),
        ],),
        ),
        ),
        ),
       ),
     ],
     ),
    );
  }
  SizedBox friendAndMore(title,number){
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.purple),
            ),
            Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color:Colors.black),
            )
        ],
      ),
    );
  }

}