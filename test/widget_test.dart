import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  const Text(
          'Favorite button with list view',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children:  <Widget>[
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),),
            child:const ListTile(
              selected: true,
              leading: FlutterLogo(),
              title: Text('One-line with widgets'),
              trailing: Icon(Icons.favorite_border),
            ),),
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),),
            child:const ListTile(
              selected: true,
              leading: FlutterLogo(),
              title: Text('One-line with widgets'),
              trailing: Icon(Icons.favorite_border),
            ),),
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),),
            child:const ListTile(
              selected: true,
              leading: FlutterLogo(),
              title: Text('One-line with widgets'),
              trailing: Icon(Icons.favorite_border),
            ),),


        ],
      ),
    );
  }
}
