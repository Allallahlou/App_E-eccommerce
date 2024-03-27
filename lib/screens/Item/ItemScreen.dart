import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/product_images_slider.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration:  const BoxDecoration(
                color: Color(0x0fd4ecf7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                   const Center(
                    child: ProductImagesSlider(),
                  ),
                  Padding(
                    padding:   const EdgeInsets.only(left: 15, top: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:   const Icon(
                        Icons.arrow_back_ios_new,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 10),
            Padding(
              padding:  const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    "Apple watch Series 6",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                   const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        itemBuilder: (context, _) =>  const Icon(
                          Icons.star,
                          color: Colors.purpleAccent,
                        ),
                        // ignore: non_constant_identifier_names
                        onRatingUpdate: (Rating) {},
                      ),
                       const SizedBox(width: 5),
                       const Text("(450)"),
                    ],
                  ),
                   const SizedBox(height: 15),
                  const Row(
                    children:  [
                      Text(
                        "140\$",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "200\$",
                        style: TextStyle(
                          color: Colors.black54,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                    const SizedBox(height: 20),
                    const Text(
                    "Recevoir un e-mail lorsque ce produit "
                        "est de nouveau en stock"
                      "Lorsque vous ajoutez le produit à votre"
                  "liste de souhaits vous recevrez  un e-mail"
                  "dès que nous l'aurons de nouveau en stock"
                  " Vous n'êtes pas obligé d'acheter"
                  "Vous voulez en savoir plus sur la liste de souhaits ? "
                  "Alors cliquez ici. ",
                    style: TextStyle(fontSize: 9),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin:  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pinkAccent,
                ),
                child:  const Center(
                  child: Text(
                    "ADD TO CART",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:  const Color(0xFFD4ECF7),
                ),
                child:  const Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
