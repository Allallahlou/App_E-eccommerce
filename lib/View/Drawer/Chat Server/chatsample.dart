import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatSample_Screen extends StatelessWidget {
  const ChatSample_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(right: 80),
        child: ClipPath(
          clipper: UpperNipMessageClipper(MessageType.receive),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
            child: const Text(
              "Hi Developer How Are you ?",
              style: TextStyle(fontSize: 16)
            ),
          ),
        ),
        ),
        Container(
          alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 80 ),
          child: ClipPath(
            clipper: LowerNipMessageClipper(MessageType.send),
            child: Container(
              padding: const EdgeInsets.only(left: 20,top:10, bottom: 25,right: 20 ),
              decoration: const BoxDecoration(
                color: Color(0xFF113953),
               ),
              child: const Text(
                  "Hello, Programmer, i am fine thanks for asking what about you. i hope you will be fine",
                  style: TextStyle(fontSize: 16, color: Colors.white)
              ),
            ),
          ),
        ),
        ),],
    );
  }
}
