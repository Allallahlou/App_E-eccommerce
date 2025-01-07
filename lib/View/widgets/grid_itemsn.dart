import 'package:flutter/material.dart';

class grid_itemsn extends StatelessWidget {
  final int index;

  const grid_itemsn(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEAEEF9),
            blurRadius: 1,
            offset: Offset(4.5, 4.5),
          ),
        ],

        color: Colors.white,
        border: Border.all(
          color: Colors.indigo,
          width: 1.5
          ),
        borderRadius: index == 0 || index % 3 == 0 ? const BorderRadius.only(
          topRight: Radius.circular(100),
          bottomLeft: Radius.circular(100),
        ) : const BorderRadius.only(
          topLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: const Column(),
    );
  }
}