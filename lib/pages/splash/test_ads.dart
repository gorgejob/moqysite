// import 'package:flutter/widgets.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class TestAds extends StatefulWidget {
//   const TestAds({super.key});

//   @override
//   State<TestAds> createState() => _TestAdsState();
// }

// class _TestAdsState extends State<TestAds> {
//   AdSize size = AdSize.banner;
//   RewardedAd ? _RewardedAd ;

//   void _loadAd() {
//     // final bannerAd = BannerAd(
//     //   size: size,
//     //   adUnitId: "ca-app-pub-3940256099942544/6300978111",
//     //   request: const AdRequest(),
//     //   listener: BannerAdListener(
//     //     // Called when an ad is successfully received.
//     //     onAdLoaded: (ad) {
//     //       if (!mounted) {
//     //         ad.dispose();
//     //         return;
//     //       }
//     //       setState(() {
//     //         _bannerAd = ad as BannerAd;
//     //       });
//     //     },
//     //     // Called when an ad request failed.
//     //     onAdFailedToLoad: (ad, error) {
//     //       debugPrint('BannerAd failed to load: $error');
//     //       ad.dispose();
//     //     },
//     //   ),
//     // );

//     // // Start loading.
//     // bannerAd.load();
//     RewardedAd.load(
//       adUnitId: "ca-app-pub-3940256099942544/5224354917",
//       request: const AdRequest(),
//       rewardedAdLoadCallback: RewardedAdLoadCallback(
//         onAdLoaded: (RewardedAd ad) {
//           // Called when an ad is successfully received.
//           debugPrint('Ad was loaded.');
//           // Keep a reference to the ad so you can show it later.
//           _RewardedAd = ad;
//         },
//         onAdFailedToLoad: (LoadAdError error) {
//           // Called when an ad request failed.
//           debugPrint('Ad failed to load with error: $error');
//         },
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadAd();
//   }

//   @override
//   void dispose() {
//     _RewardedAd?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox(
//         width: size.width.toDouble(),
//         height: size.height.toDouble(),
//         child:
//             _RewardedAd == null
//                 // Nothing to render yet.
//                 ? const SizedBox()
//                 // The actual ad.
//                 : AdWidget(ad: _RewardedAd!),
//       ),
//     );
//   }
// }
