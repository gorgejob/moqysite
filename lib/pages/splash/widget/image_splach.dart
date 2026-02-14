import 'package:flutter/material.dart';
import 'package:musicapp/core/widget/font_size.dart';

class ImageSplach extends StatelessWidget {
  const ImageSplach({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/gorge5.jpg",
      height: CustomSize().height(context) * 0.3,
    );
  }
}