// ignore_for_file: camel_case_types

import 'package:app_e_ecommerce/View/Drawer/Chat%20Server/chatsample.dart';
import 'package:flutter/material.dart';
import 'ChatBottomSheet.dart';

class chatpage_screen extends StatelessWidget {
  const chatpage_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            leadingWidth: 30,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    "images/ee.png",
                    height: 45,
                    width: 39,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Text(
                    "Programmer",
                    style: TextStyle(color: Color(0xFF113953)),
                  ),
                ),
              ],
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 23),
                child: Icon(Icons.call,
                color:  Color(0xFF113953),
                  size: 23,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 23),
                child: Icon(Icons.video_call,
                  color:  Color(0xFF113953),
                  size: 23,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.more_vert,
                  color:  Color(0xFF113953),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20 , left: 20, right: 20, bottom:80),
        children: const [
          ChatSample_Screen(),
          ChatSample_Screen(),
          ChatSample_Screen(),
          ChatSample_Screen(),
          ChatSample_Screen(),
          ChatSample_Screen(),
          ChatSample_Screen(),
        ],
      ),
      bottomSheet: const ChatBottomSheet(),
    );
  }
}
