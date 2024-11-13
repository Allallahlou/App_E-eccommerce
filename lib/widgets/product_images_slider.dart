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
        Padding(padding:  const EdgeInsets.all(8),
        child: Image.asset("images/Swatch_YCS_590G.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch_Irony_pour_homme.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch_Unisex_Chronographe_Quartz.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch_YWS420G_Menichelli.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/SWATCH_MENS_SWISS_SY23S413.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/SWATCH_MENS_IRONY_CHRONOGRAPH_SS.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch_Chrono_Swatchour_YVS426G.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/SWATCH_SYXG110G.png"),),
      ],
    );
  }
}
