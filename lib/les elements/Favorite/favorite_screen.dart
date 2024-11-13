import 'package:app_e_ecommerce/Drawer/Product%20Information/SWATCH%20Analogique.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/SWATCH%20MENS%20SWISS%20SY23S413.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/SWATCH%20SYXG110G.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/SWATCH%20YCS%20590G.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/Swatch%20Bijoux%20Jewelry.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/Swatch%20Chrono%20Swatchour%20YVS426G.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/Swatch%20Hombre%20Irony%20Xlite%20Red%20Attack.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/Swatch%20Irony%20-%20Chrono%20New%20YVB416%20BY%20the%20bonfire.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/Swatch%20Unisex%20Chronographe%20Quartz.dart';
import 'package:app_e_ecommerce/Drawer/Product%20Information/Swatch5.dart';
import 'package:app_e_ecommerce/les%20elements/Home/home_scren.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          'Favorite Product',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch5.png'),
              title: const Text('Swatch5'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Swatch5_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_YCS_590G.png'),
              title: Text('SWATCH YCS 590G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SWATCH_YCS_590G_Screen()),);
              },
            ),
          ),
          Container(
            padding:const EdgeInsets.all(2),
            margin:const  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading:
                  Image.asset(
                    'images/Swatch_Unisex_Chronographe_Quartz.png'
                    ),
              title: const Text(
                'Swatch Unisex Chronographe Quartz'
                ),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Swatch_Unisex_Chronographe_Quartz_Screen()));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset(
                'images/SWATCH_SYXG110G.png'
                ),
              title: const Text(
                'SWATCH SYXG110G'
                ),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SWATCH_SYXG110G_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_MENS_SWISS_SY23S413.png'),
              title: Text('SWATCH MENS SWISS SY23S413'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SWATCH_MENS_SWISS_SY23S413_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch_Bijoux_Jewelry.png'),
              title: Text('Swatch Bijoux Jewelry'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Swatch_Bijoux_Jewelry_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading:
                  Image.asset('images/Swatch_Chrono_Swatchour_YVS426G.png'),
              title: Text('Swatch Chrono Swatchour YVS426G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Swatch_Chrono_Swatchour_YVS426G_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset(
                  'images/Swatch_Hombre_Irony_Xlite_Red_Attack.png'),
              title: Text('Swatch Hombre Irony Xlite Red Attack'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Swatch_Hombre_Attack_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset(
                  'images/Swatch_Irony_Chrono_New_YVB416_By_the_bonfire.png'),
              title: Text('Swatch Irony - Chrono New YVB416 By the bonfire'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Swatch_Irony_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_Analogique.png'),
              title: Text('SWATCH Analogique'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SWATCH_Analogique_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_SYXG110G.png'),
              title: Text('SWATCH SYXG110G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SWATCH_SYXG110G_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_MENS_SWISS_SY23S413.png'),
              title: Text('SWATCH MENS SWISS SY23S413'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SWATCH_MENS_SWISS_SY23S413_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch_Bijoux_Jewelry.png'),
              title: Text('Swatch Bijoux Jewelry'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Swatch_Bijoux_Jewelry_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading:
                  Image.asset('images/Swatch_Chrono_Swatchour_YVS426G.png'),
              title: Text('Swatch Chrono Swatchour YVS426G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Swatch_Chrono_Swatchour_YVS426G_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_SYXG110G.png'),
              title: Text('SWATCH SYXG110G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SWATCH_SYXG110G_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_MENS_SWISS_SY23S413.png'),
              title: Text('SWATCH MENS SWISS SY23S413'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SWATCH_MENS_SWISS_SY23S413_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch_Bijoux_Jewelry.png'),
              title: Text('Swatch Bijoux Jewelry'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Swatch_Bijoux_Jewelry_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading:
                  Image.asset('images/Swatch_Chrono_Swatchour_YVS426G.png'),
              title: Text('Swatch Chrono Swatchour YVS426G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Swatch_Chrono_Swatchour_YVS426G_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_SYXG110G.png'),
              title: Text('SWATCH SYXG110G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SWATCH_SYXG110G_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/SWATCH_MENS_SWISS_SY23S413.png'),
              title: Text('SWATCH MENS SWISS SY23S413'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SWATCH_MENS_SWISS_SY23S413_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch_Bijoux_Jewelry.png'),
              title: Text('Swatch Bijoux Jewelry'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Swatch_Bijoux_Jewelry_Screen()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading:
                  Image.asset('images/Swatch_Chrono_Swatchour_YVS426G.png'),
              title: Text('Swatch Chrono Swatchour YVS426G'),
              trailing: FavoriteButton(
                  isFavorite: false,
                  valueChanged: (isFavorite) {
                    if (kDebugMode) {
                      print('Is Favorite : $isFavorite');
                    }
                  }),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Swatch_Chrono_Swatchour_YVS426G_Screen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
