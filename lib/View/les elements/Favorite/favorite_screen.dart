import 'package:app_e_ecommerce/View/les%20elements/Favorite/FavoriteSearchDelegate.dart';
import 'package:app_e_ecommerce/View/les%20elements/Home/home_scren.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteWatches = [
    {
      "image": "Images/Irony_pour_homme.png",
      "name": " Irony Pour Homme",
      "price": "\$220"
      },
    {
      "image": "Images/YCS590G.png",
      "name": "YCS_590G",
      "price": "\$280"
      },
    {
      "image": "Images/Analogique.png",
      "name": "Analogique",
      "price": "\$300"
      },
    {
      "image": "Images/Bijoux_Jewelry.png",
      "name": "Bijoux Jewelry",
      "price": "\$220"
      },
    {
      "image": "Images/Swatchour_YVS426G.png",
      "name": "Chrono Swatchour YVS426G", 
      "price": "\$100"
      },
    {
      "image": "Images/Hombre_Irony_Xlite_Red_Attack.png",
      "name": "Hombre Irony Xlite Red Attack",
      "price": "\$210"
      },
    {
      "image": "Images/Irony_Chrono_New_YVB416_bonfire.png",
      "name": "Irony Chrono New YVB416 ",
      "price": "\$600"
      },
    {
      "image": "Images/Unisex_Chronographe_Quartz.png",
      "name": "Unisex Chronographe Quartz",
      "price": "\$160"
      },
    {
      "image": "Images/Mens_Irony_Chronograph.png",
      "name": "Mens Irony Chronograph ",
      "price": "\$270"
      },
    {
      "image": "Images/Mens_Swiss_SY23S413.png",
      "name": "Mens SwissSY23S413",
      "price": "\$450"
      },

  ];

  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
  title: const Center(child: Text("Favorites")),
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) =>  const HomeScreen(),
          ),
          ); // الرجوع إلى الشاشة السابقة
    },
  ),

        actions: [
          const Text("Search"),
          IconButton(
            icon: const Icon(
              Icons.search
              ),
            onPressed: (){
              showSearch(
          context: context,
          delegate: FavoriteSearchDelegate(),
        );
            },
          ),
        ],
        
      ),
      
      body: favoriteWatches.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "لم تقم بإضافة أي ساعة إلى المفضلة بعد!",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Action to browse watches
                    },
                    child: const Text("تصفح الساعات"),
                  ),
                ],
              ),
            )

          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favoriteWatches.length,
              itemBuilder: (ctx, index) {
                final watch = favoriteWatches[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  
                  child: Column(
                    children: [
                      const SizedBox(height: 70,),
                      Image.asset(
                       watch['image'],
                       fit: BoxFit.cover,
                       height: 120),

                      const SizedBox(height: 10),

                      Text(
                        watch['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                          ),
                      ),

                      const SizedBox(height: 20,),

                      Text(
                        watch['price']),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/FavoritesScreen');
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
