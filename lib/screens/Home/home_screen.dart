import 'package:app_e_ecommerce/Drawer/Help.dart';
import 'package:app_e_ecommerce/Drawer/Logout.dart';
import 'package:app_e_ecommerce/Drawer/Notification.dart';
import 'package:app_e_ecommerce/Drawer/Settings.dart';
import 'package:app_e_ecommerce/Drawer/Upload_shot.dart';
import 'package:app_e_ecommerce/screens/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/widgets/grid_items.dart';
import 'package:flutter/material.dart';

import '../../Drawer/Profile.dart';
import '../../Drawer/message.dart';
import '../Cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Color> Clrs = [
      const Color.fromARGB(255, 246, 111, 58),
      const Color.fromARGB(255, 36, 131, 233),
      const Color.fromARGB(255, 63, 208, 143),
    ];

    var imageList = [
      "images/Casqe.png",
      "images/USP.png",
      "images/Swatch.png",
    ];

    var iconImageList = [
      "images/3swatch.png",
      "images/Adidas.png",
      "images/Casqe.png",
      "images/eee.png",
      "images/Iphone.png",
      "images/mmm.png",
      "images/Nike.png",
      "images/shop.png",
      "images/shopping.png",
      "images/Swatch.png",
      "images/USP.png",
      "images/Swatch6.png",
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [

          Container(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  CartScreen()));},

              child: const Icon(
                Icons.shopping_cart,
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

                accountName: const Text('ALLAL LAHLOU'),
                accountEmail:const Text('allal.lahlou333@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(child: Image.asset('images/photo.png'),),),

              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                    image: AssetImage('images/rt.png'),
                    fit: BoxFit.cover
                ),),),

            ListTile(leading: const Icon(Icons.file_upload),
            title:  Text('Upload shot'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Upload_shot_Screen())),
            ),

            ListTile(leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap:() =>  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile_Screen())),
            ),

            ListTile(leading: const Icon(Icons.message),
              title: const Text('message'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Message_Screen())),
            ),

            ListTile(leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Help_Screen())),
            ),

            ListTile(leading: const Icon(Icons.share),
              title: const Text('share'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Help_Screen())),
            ),

            ListTile(leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Screen())),
            ),

            const Divider(),

            ListTile(leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Settings_Screen())),
            ),

            ListTile(leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => Logout_Screen())),
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
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 5.5,
                      decoration: BoxDecoration(
                        color: Clrs[i],
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
                                    color: Colors.deepPurple,
                                    fontSize: 22,
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Shop Now",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
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
                    for (var i = 0; i < 7; i++)
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
            GridItems(),
          ],
        ),
      ),
    );
  }
}
