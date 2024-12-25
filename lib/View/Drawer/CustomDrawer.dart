import 'package:app_e_ecommerce/View/Drawer/App%20Rating/app%20rating.dart';
import 'package:app_e_ecommerce/View/Drawer/Notification/Notification.dart';
import 'package:app_e_ecommerce/View/Drawer/Share/share.dart';
import 'package:app_e_ecommerce/View/Drawer/Support/Support.dart';
import 'package:app_e_ecommerce/View/Login%20Screen/LoginScreen.dart';
import 'package:app_e_ecommerce/provider/mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Account/LanguageInfo.dart';
import '../Login Screen/Payment.dart';
import '../Offers/Offers.dart';
import '../les_elements/Favorite/favorite_screen.dart';
import 'About/About.dart';
import 'Delivery Service/Delivery Service.dart';
import 'Settings/Settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.white, 
        width: MediaQuery.of(context).size.width / 2, 
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
              accountEmail: const Text('Support.App@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset('images/drawer.png'),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                image: DecorationImage(
                  image: AssetImage('images/pex.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text("Night mode"),
              trailing: Switch(
                value: Provider.of<ModeProvider>(context).lightModeEnable,
                onChanged: (value) {
                  Provider.of<ModeProvider>(context, listen: false).chaneMode();
                },
              ),
            ),
            ListTile(
                  leading: const Icon(
                    Icons.person
                    ),
        
                  title: const Text(
                    'Account'
                    ),
        
                  onTap:() => Navigator.push(
        
                    context, MaterialPageRoute(
                      builder: (context) =>
                       const LoginScreen()
                       ),
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
        
        
                
        
        
                const Divider(),
        
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
        
            // باقي العناصر هنا بنفس الطريقة
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
