import 'package:app_e_ecommerce/Account/Account%20Informations.dart';
import 'package:app_e_ecommerce/Account/Language.dart';
import 'package:app_e_ecommerce/Account/Notifications.dart';
import 'package:app_e_ecommerce/Account/Offers.dart';
import 'package:app_e_ecommerce/Account/Payment.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 45, bottom: 10),
                child: const Center(
                  child: Text(
                    'Account',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'images/shopping.png',
                    height: 140,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Text('ALLAL LAHLOU'),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Text('Membre Since 2020'),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text('Edit Account')),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.store,
                      size: 20,
                      color: Colors.red,
                    ),
                    Text(
                      'Orders',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.location_city,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text(
                      'My Adress',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.black,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                trailing: const Icon(Icons.east_rounded),
                title: const Text('Account Informations'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Account_Informations_Screen()));
                },
              ),
              ListTile(
                trailing: const Icon(Icons.east_rounded),
                title: const Text('Language'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Language_Informations_Screen()));
                },
              ),
              ListTile(
                trailing: const Icon(Icons.east_rounded),
                title: const Text('Notifications'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Notifications_Informations_Screen()));
                },
              ),
              ListTile(
                title: const Text('Offers'),
                trailing: const Icon(Icons.east_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Offers_Informations_Screen()));
                },
              ),

              ListTile(
                trailing: const Icon(Icons.east_rounded),
                title: const Text('Payment'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Payment_Informations_Screen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
