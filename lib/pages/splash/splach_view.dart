import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:musicapp/core/widget/colors.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/pages/home/home_views.dart';
import 'package:musicapp/pages/splash/widget/image_splach.dart';
import 'package:musicapp/pages/splash/widget/title_splach.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  BannerAd? _bannerAd;

  /// Loads a banner ad.
  

  @override
  void initState() {
    // تفعيل مراقب الحالة
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => const HomeViews(),
        ),
      );
    });
    super.initState();
  }
  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = CustomSize();
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: size.height(context) * 0.2,
            child: const ImageSplach(),
          ),
          const TitleSplach(),
        ],
      ),
    );
  }
}
