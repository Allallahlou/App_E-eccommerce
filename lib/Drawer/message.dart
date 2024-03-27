import 'package:app_e_ecommerce/Drawer/ActiveChats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'RecentChats.dart';

class Message_Screen extends StatelessWidget {
  const Message_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: Text(
            "Messages",
            style: TextStyle(
                color: Color(0xFF113953),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                Icon(Icons.search,
                color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ),
        ActiveChats_Screen(),
        RecentChats(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.message),
      ),
    );
  }
}
