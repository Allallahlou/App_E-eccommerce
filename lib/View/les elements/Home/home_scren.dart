import 'package:app_e_ecommerce/View/Account/LanguageInfo.dart';
import 'package:app_e_ecommerce/View/CartScreen/Cart_Screen.dart';
import 'package:app_e_ecommerce/View/CartScreen/MainPage.dart';
import 'package:app_e_ecommerce/View/Drawer/App%20Rating/app%20rating.dart';
import 'package:app_e_ecommerce/View/Drawer/Share/share.dart';
import 'package:app_e_ecommerce/View/Drawer/Support/Support.dart';
import 'package:app_e_ecommerce/View/Drawer/About/About.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Settings/Settings.dart';
import 'package:app_e_ecommerce/View/Drawer/Delivery%20Service/Delivery%20Service.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/LoginScreen.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/Payment.dart';
import 'package:app_e_ecommerce/View/les%20elements/Favorite/favorite_screen.dart';
import 'package:app_e_ecommerce/View/Offers/Offers.dart';
import 'package:app_e_ecommerce/View/widgets/grid_items.dart';
import 'package:app_e_ecommerce/provider/mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Color> Cars = [
      const Color.fromARGB(
        255, 139, 149, 149
        ),
      const Color.fromARGB(
        255, 139, 149, 149
        ),
      const Color.fromARGB(
        255, 139, 149, 149
        ),
    ];

    var imageList = [
      "images/Unisex_Chronographe_Quartz.png",
      "images/YWS420G_Menichelli.png",
      "images/Bijoux_Jewelry.png",
    ];

    var iconImageList = [
      "images/SYXG110G.png",
      "images/YCS590G.png",
      "images/Unisex_Chronographe_Quartz.png",
      "images/YWS420G_Menichelli.png",
      "images/Mens_Swiss_SY23S413.png",
      "images/Mens_Irony_Chronograph.png",
      "images/Swatchour_YVS426G.png",
      "images/Irony_pour_homme.png",
      "images/Analogique.png",
      "images/Apple_Swatch_Black.png",
    ];

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.grey,
        title:  Center(
          child: Text(

            "App E Commerce",
             style: GoogleFonts.adamina(

               textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent.shade400,
                letterSpacing:.5
                ),
                ),
              ),
              ),

        actions: [
          
            Container(
              
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                 Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const MainPage()
                    ),
                    );
              },

              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey.shade900,
                size: 30,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                 Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) =>
                     const NoificationScreen()
                     ),
                     );
              },

              child:  Icon(
                Icons.notification_add_sharp,
                color: Colors.grey.shade900,
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

                accountName: const Text(
                  'Application Ecommerce',
                  style: TextStyle(
                    
                    color: Colors.white,
                    ),
                  ),
                accountEmail:const Text(
                  'Support.App@gmail.com'
                  ),

              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'images/drawer.png'
                    ),
                    ),
                    ),

              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                image: DecorationImage(
                    image: AssetImage(
                      'images/pex.png'
                      ),
                    fit: BoxFit.cover
                ),
                ),
                ),

            ListTile(
            leading: const Icon(
              Icons.brightness_6
              ),

            title: const Text(
              "Night mode "
              ),

            trailing: Switch(
              value: Provider.of<ModeProvider>(context).lightModeEnable,
              onChanged: (value) {
                Provider.of<ModeProvider>(context, listen: false)
                    .chaneMode(); 
                  // Change mode
                                },
            ),
          ),

            ListTile(
              leading: const Icon(
                Icons.delivery_dining
                ),

              title: const Text(
                'Delivery Service'
                ),

              onTap:() => Navigator.push(

                context, MaterialPageRoute(
                  builder: (context) =>
                   const DeliveryProfileScreen()
                   ),
                   ),
            ),

             ListTile(
              leading: const Icon(
                Icons.production_quantity_limits
                ),

              title: const Text(
                'Product Information'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>  
                  FavoritesScreen()
                  ),

                  ),
            ),

            ListTile(
              leading: const Icon(
                Icons.language
                ),

              title: const Text(
                'Language'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>
                   const LanguageInfoScreen()
                   ),
                   ),
            ),

            ListTile(
              leading: const Icon(
                Icons.notification_add
                ),

              title: const Text(
                'Notifications'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => 
                  const NoificationScreen()
                  ),

                  ),
            ),

            ListTile(
              leading: const Icon(
                Icons.work
                ),

              title: const Text(
                'Offers'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>
                   const Offers_Screen()
                   ),

                   ),
            ),
            
             ListTile(
              leading: const Icon(
                Icons.payment
                ),

              title: const Text(
                'Payments'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>
                    const PaymentScreen()
                    ),
                    ),

            ),

            ListTile(
              leading: const Icon(
                Icons.message
                ),

              title: const Text(
                'Chat Server'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>
                   const ChatScreen()
                   ),
                   ),
            ),

            ListTile(
              leading: const Icon(
                Icons.share
                ),

              title: const Text(
                'share'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>
                   Share_Screen()
                   ),
                   ),
            ),

             ListTile(
              leading: const Icon(
                Icons.reviews_rounded
                ),

              title: const Text(
                'App Rating'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>
                   AppRatingScreen()
                   ),
                   ),
            ),


            ListTile(
              leading: const Icon(
                Icons.help_rounded
                ),

              title: const Text(
                'About'
                ),

              onTap:() => Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>
                   const AboutAppScreen()
                   ),
                   ),
            ),


            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.settings
                ),

              title: const Text(
                'Settings'
                ),

              onTap:() => Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => const Settings_Screen()
              ),
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.logout
                ),

              title: const Text(
                'Logout'
                ),

              onTap: () => Navigator.push( context,
                 MaterialPageRoute(
                  builder: (context) =>
                  const LoginScreen()
                  ),

                  ),
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
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                Text(
                  " Hello Dear",
                  style: GoogleFonts.adamina(
                     textStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
                     fontSize: 24,
                     letterSpacing:.5
                  ),
                  ),
                ),

                  SizedBox(height: 0),

                  Text(
                  "Lets shop something",
                  style: GoogleFonts.adamina(
                     textStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.orangeAccent.shade700,
                     fontSize: 25,
                     letterSpacing:.5
                    
                  ),
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
                      margin:
                       const EdgeInsets.only(right: 10),
                      padding:
                       const EdgeInsets.only(left: 10),
                      width:
                       MediaQuery.of(context).size.width / 1.4,
                      height:
                       MediaQuery.of(context).size.height / 5.5,

                      decoration: BoxDecoration(
                        color: Cars[i],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment:
                               MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                               CrossAxisAlignment.start,
                              children: [
                                 Text(
                                   "30 off on winter Collection",
                                   style: GoogleFonts.adamina(
                                   textStyle: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black,
                                   fontSize: 21,
                                   letterSpacing:.5
                    
                                 ),
                                ),
                             ),

                                Padding(
                                  padding:  const EdgeInsets.all(16.0),
                                  child: ElevatedButton.icon(
                                    onPressed: (){
                                       Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) =>
                                     const CardScreen()
                                   ),
                                  );
                                  },

                                    icon:const Icon(Icons.shop),
                                    label:  Text(
                                      "Shop New",
                                       style: GoogleFonts.adamina(
                                        textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent.shade400,
                                        letterSpacing:.5
                                      ),
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
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

             Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                ),
              child: Row(
                mainAxisAlignment:
                 MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                      foregroundColor: Colors.deepOrange,
                  ),

                  onPressed: () {
                  Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) =>  FavoritesScreen()
                  ),
                );
              },

               child: Text(
                  "See All",
                  style: GoogleFonts.adamina(
                     textStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.pinkAccent.shade400,
                     letterSpacing:.5
                  ),
                  ),
                ),

              ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                 const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    for (var i = 0; i < 10; i++)
                      Container(
                        height: 50,
                        width: 50,
                        margin:
                         const EdgeInsets.all(8),
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
                          child: Image.asset(
                            iconImageList[i]
                            ),
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