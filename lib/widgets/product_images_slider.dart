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
        child: Image.asset("images/Swatch.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch1.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch2.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch3.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch4.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch5.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch6.png"),),
        Padding(padding:  const EdgeInsets.all(8),
          child: Image.asset("images/Swatch7.png"),),
      ],
    );
  }
}
