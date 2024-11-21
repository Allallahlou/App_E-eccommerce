import 'package:flutter/material.dart';

class Chats_Screen extends StatelessWidget {

  const Chats_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(

      padding: const EdgeInsets.only(top: 25, left: 5,),

      child: SingleChildScrollView(

        scrollDirection: Axis.horizontal,

        child: Row(

          children: [
            for (int i = 0 ; i< 20; i++)

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),

              child: Container(
                width: 65,
                height: 65,

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),

                  boxShadow: [
                    BoxShadow(

                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0,3),

                    ),
                  ]
                ),
                
                child: ClipRect(
                  child: Image.asset(
                    "images/person.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
