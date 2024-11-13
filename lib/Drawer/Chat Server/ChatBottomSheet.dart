import 'package:flutter/material.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2, blurRadius: 10, offset: const Offset(0,3)),
      ]
      ),
      child: Row(children: [
        const Padding(padding: EdgeInsets.only(left: 8),
      child: Icon(
        Icons.add,
        color: Color(0xFF113953),
        size: 30,
      ),
      ),
        const Padding(padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.emoji_emotions_outlined,
            color: Color(0xFF113953),
            size: 30,
          ),
        ),
        Padding(padding: const EdgeInsets.only(left: 10),
        child: Container(
          alignment: Alignment.centerRight,
          width: 237,
          child: TextFormField(
            decoration: const InputDecoration(
                hintText: "Type omething",
              border: InputBorder.none,
            ),
          ),
        ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.send,
          color: Color(0xFF113953),
          size: 30,),
        ),
      ],),
    );
  }
}
