import 'package:flutter/material.dart';
import 'package:musicapp/core/widget/custom_text.dart';
import 'package:musicapp/core/widget/font_size.dart';

class TitleSplach extends StatelessWidget {
  const TitleSplach({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 180,
      right: 0,
      left: 0,
      child: Column(
        children: [
          const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 5,
            constraints: BoxConstraints(
              maxHeight: 150,
              maxWidth: 150,
              minHeight: 60,
              minWidth: 60,
            ),
          ),
          const SizedBox(height: 80),
          CustomText(
            text: "... يرجي الانتظار",
            color: Colors.white,
            fontsize: CustomSize().fontsizeLarge(context) * 0.8,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: "مهرجانات 2026",
      color: Colors.white,
      fontsize: CustomSize().fontsizeLarge(context) * 0.8,
      textAlign: TextAlign.center,
    );
  }
}
