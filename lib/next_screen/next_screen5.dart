import 'package:flutter/material.dart';

class NextScreen5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding:  EdgeInsets.only(top: 100),
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
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: 150.00,
                        height: 150.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('images/Iphone.png'),
                            fit: BoxFit.contain,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'IPHONE',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '129,20\$',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
