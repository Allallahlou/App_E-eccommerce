
// ignore_for_file: non_constant_identifier_names

import 'package:app_e_ecommerce/View/Account/Language.dart';
import 'package:app_e_ecommerce/View/Drawer/Help.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings.dart';
import 'package:app_e_ecommerce/View/Drawer/mon_profile.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payments.dart';
import 'package:app_e_ecommerce/View/les%20elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/login_screen.dart';
import 'package:app_e_ecommerce/View/Offers/Offers.dart';
import 'package:app_e_ecommerce/View/widgets/grid_items.dart';
import 'package:flutter/material.dart';
import '../../Drawer/Chat Server/message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Color> Cars = [
      const Color.fromARGB(255, 139, 149, 149),
      const Color.fromARGB(255, 139, 149, 149),
      const Color.fromARGB(255, 139, 149, 149),
    ];

    var imageList = [
      "images/Swatch_Unisex_Chronographe_Quartz.png",
      "images/Swatch_YWS420G_Menichelli.png",
      "images/Swatch_Bijoux_Jewelry.png",
    ];

    var iconImageList = [
      "images/3swatch.png",
      "images/Swatch_YCS_590G.png",
      "images/Swatch_Unisex_Chronographe_Quartz.png",
      "images/Swatch_YWS420G_Menichelli.png",
      "images/SWATCH_MENS_SWISS_SY23S413.png",
      "images/SWATCH_MENS_IRONY_CHRONOGRAPH_SS.png",
      "images/Swatch_Chrono_Swatchour_YVS426G.png",
      "images/Swatch_Irony_pour_homme.png",
      "images/SWATCH_analogique.png",
      "images/Swatch6.png",
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [

            Container(
              
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Notification_Screen()));
              },

              child: const Icon(
                Icons.shopping_bag,
                color: Colors.pink,
                size: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Notification_Screen()));
              },

              child: const Icon(
                Icons.notification_add_sharp,
                size: 30,
              ),
            ),
          ),
        ],
      ),

      ///////////////////////////////Drawer ////////////////////////////////

      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            UserAccountsDrawerHeader(

                accountName: const Text('Application Ecommerce'),
                accountEmail:const Text('Support.App@gmail.com'),

              currentAccountPicture: CircleAvatar(
                child: ClipOval(child: Image.asset('images/drawer.png'),),),

              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                image: DecorationImage(
                    image: AssetImage('images/pex.png'),
                    fit: BoxFit.cover
                ),
                ),
                ),

            ListTile(leading: const Icon(Icons.person),
              title: const Text('Mon Profile'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Mon_Profile_Screen())),
            ),

             ListTile(leading: const Icon(Icons.production_quantity_limits),
              title: const Text('Product Information'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteScreen())),
            ),

            ListTile(leading: const Icon(Icons.language),
              title: const Text('Language'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Language_Information_Screen())),
            ),

            ListTile(leading: const Icon(Icons.notification_add),
              title: const Text('Notifications'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Notification_Screen())),
            ),

            ListTile(leading: const Icon(Icons.work),
              title: const Text('Offers'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Offers_Screen())),
            ),
            
             ListTile(leading: const Icon(Icons.payment),
              title: const Text('Payments'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) =>  const PaymentsScreen())),
            ),

            ListTile(leading: const Icon(Icons.message),
              title: const Text('Chat Server'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Message_Screen())),
            ),

            ListTile(leading: const Icon(Icons.share),
              title: const Text('share'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Help_Screen())),
            ),

            ListTile(leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => const Help_Screen())),
            ),


            const Divider(),

            ListTile(leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap:() => Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => const Settings_Screen()
              ),
              ),
            ),

            ListTile(leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.push( context,
                 MaterialPageRoute(
                  builder: (context) =>const login_screen())),
            ),
          ],
        ),
      ),



      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 3,
                left: 15,
                right: 15,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Dear",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 0),

                  Text(
                    "Lets shop something",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),

              child: Row(
                children: [

                  for (int i = 0; i < 3; i++)

                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 5.5,

                      decoration: BoxDecoration(
                        color: Cars[i],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "30 off on winter Collection",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ElevatedButton.icon(
                                    onPressed: (){},
                                    icon:const Icon(Icons.shop),
                                    label: const Text(
                                      "Shop New",
                                      style: TextStyle(fontSize: 16,color: Colors.pink),
                                      ),),
                                )
                                ],
                            ),
                          ),
                          
                          Image.asset(
                            imageList[i],
                            height: 100,
                            width: 110,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    for (var i = 0; i < 10; i++)
                      Container(
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4ECF7),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black87,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(iconImageList[i]),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            GridItems(6),
          ],
        ),
      ),
    );
  }
}