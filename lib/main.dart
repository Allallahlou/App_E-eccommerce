import 'package:app_e_ecommerce/screens/Account/account_screen.dart';
import 'package:app_e_ecommerce/screens/Home/home_screen.dart';
import 'package:app_e_ecommerce/screens/Screens/screens.dart';
import 'package:app_e_ecommerce/widgets/grid_items.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget{
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return   const MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Screens(),
    );
  }
}