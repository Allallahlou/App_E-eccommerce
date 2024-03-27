import 'package:app_e_ecommerce/screens/Account/account_screen.dart';
import 'package:flutter/material.dart';

class Account_Informations_Screen extends StatelessWidget {
  const Account_Informations_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(

            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountScreen()
                  )
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text('Profile', style: Theme.of(context).textTheme.headlineMedium),

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? Icons.light_mode : Icons.light_mode),),
        ],

      ),

      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Image.asset('images/shop.png', height: 240,),],
        ),
      ),

    );
  }
}
