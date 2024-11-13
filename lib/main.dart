import 'package:app_e_ecommerce/Drawer/mon_profil.dart';
import 'package:app_e_ecommerce/les%20elements/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/les%20elements/Login%20Screen/product_screen1.dart';
import 'package:app_e_ecommerce/les%20elements/Login%20Screen/signup_screen.dart';
import 'package:app_e_ecommerce/les%20elements/screns/screns.dart';
import 'package:app_e_ecommerce/widgets/grid_itemsn.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget{
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return   MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: screes(),
    );
  }

}
