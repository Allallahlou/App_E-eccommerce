import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductImagesSlider extends StatelessWidget {
  const ProductImagesSlider({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorBackgroundColor: Colors.white,
      height: 300,
      autoPlayInterval: 3000,
      indicatorRadius: 4,
      isLoop: true,
      children: [
        Padding(
          padding:  const EdgeInsets.all(8),
        child: Image.asset(
          "images/YCS590G.png"
          ),
          ),
        Padding(
          padding:  const EdgeInsets.all(8),
          child: Image.asset(
            "images/Irony_pour_homme.png"
            ),
            ),
        Padding(
          padding:  const EdgeInsets.all(8),
          child: Image.asset(
            "images/Unisex_Chronographe_Quartz.png"
            ),
            ),
        Padding(
          padding:  const EdgeInsets.all(8),
          child: Image.asset(
            "images/YWS420G_Menichelli.png"
            ),
            ),
        Padding(
          padding:  const EdgeInsets.all(8),
          child: Image.asset(
            "images/Mens_Swiss_SY23S413.png"
            ),),
        Padding(
          padding:  const EdgeInsets.all(8),
          child: Image.asset(
            "images/Mens_Irony_Chronograph.png"
            ),
            ),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset(
            "images/Swatchour_YVS426G.png"
            ),
            ),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset(
            "images/SYXG110G.png"
            ),
            ),
      ],
    );
  }
}
