import 'package:app_e_ecommerce/View/Drawer/Chat%20Server/ActiveChats.dart';
import 'package:flutter/material.dart';
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
        const Padding(
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 266,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.search,
                color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ),
        const Chats_Screen(),
        const RecentChats(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.pinkAccent,
        child:  const Icon(Icons.message),
      ),
    );
  }
}
