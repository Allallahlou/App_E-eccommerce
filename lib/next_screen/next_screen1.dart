import 'package:flutter/material.dart';

class NextScreen1 extends StatelessWidget {
  const NextScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      color: Colors.white,
      padding:  const EdgeInsets.only(top: 100),

      child: Center(

        child: Column(
          children: [

            Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.red[100],

              child: SizedBox(

                width: 310,
                height: 400,

                child: Padding(

                  padding:  const EdgeInsets.all(20.0),

                  child: Column(
                    children: [
                      Container(
                        width: 150.00,
                        height: 150.00,

                        decoration:  const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('images/Swatch4.png'),
                            fit: BoxFit.contain,
                          ),

                          shape: BoxShape.rectangle,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        'SWATCH',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        '14,20\$',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            width: 100,
                          ),

                        ],),],),),),
            ),],),),);
  }}
