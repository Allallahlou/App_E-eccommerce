import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../next_screen/next_screen1.dart';
import '../../next_screen/next_screen10.dart';
import '../../next_screen/next_screen11.dart';
import '../../next_screen/next_screen2.dart';
import '../../next_screen/next_screen3.dart';
import '../../next_screen/next_screen4.dart';
import '../../next_screen/next_screen5.dart';
import '../../next_screen/next_screen6.dart';
import '../../next_screen/next_screen7.dart';
import '../../next_screen/next_screen8.dart';
import '../../next_screen/next_screen9.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title:  const Text(
          'Favorite Product',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding:  const EdgeInsets.all(2),
            margin:  const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch5.png'),
              title:  const Text('Swatch5'),
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
                        builder: (context) => NextScreen1()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Adidas.png'),
              title:  Text('Adidas'),
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
                        builder: (context) =>  NextScreen2()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Casqe.png'),
              title:  Text('Casqe'),
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
                        builder: (context) =>  NextScreen3()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch3.png'),
              title:  Text('Swatch3'),
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
                        builder: (context) =>  NextScreen4()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Iphone.png'),
              title:  Text('Iphone'),
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
                        builder: (context) =>  NextScreen5()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch4.png'),
              title:  Text('Swatch4'),
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
                        builder: (context) =>  NextScreen6()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Nike.png'),
              title:  Text('Nike'),
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
                        builder: (context) =>  NextScreen7()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch1.png'),
              title:  Text('Swatch1'),
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
                        builder: (context) =>  NextScreen8()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch2.png'),
              title:  Text('Swatch2'),
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
                        builder: (context) =>  NextScreen9()));
              },
            ),
          ),
          Container(
            padding:  const EdgeInsets.all(2),
            margin:  const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/Swatch.png'),
              title:  const Text('Swatch'),
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
                        builder: (context) =>  NextScreen10()));
              },
            ),
          ),
          Container(
            padding:  EdgeInsets.all(2),
            margin:  EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            child: ListTile(
              selected: true,
              leading: Image.asset('images/USP.png'),
              title:  Text('USP'),
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
                        builder: (context) => NextScreen11()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
