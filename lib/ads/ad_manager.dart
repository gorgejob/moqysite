// import 'dart:io';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdManager {
//   // كود الإعلان الحقيقي بتاعك
//   // static String interstitialAdUnitId = 'ca-app-pub-8665665340644284/6956699970';
//   static String interstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712';

//   // 1. دالة فحص النت (داخلية)
//   static Future<bool> _hasInternet() async {
//     try {
//       final result = await InternetAddress.lookup('google.com');
//       return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
//     } catch (_) {
//       return false;
//     }
//   }

//   // 2. تشغيل المحرك (نادي عليها في الـ main)
//   static Future<void> initAds() async {
//     await MobileAds.instance.initialize();
//   }

//   // 3. إظهار الإعلان مع فحص النت تلقائياً
//   static void showInterstitial() async {
//     // التأكد من وجود نت أولاً
//     bool connected = await _hasInternet();
    
//     if (!connected) {
//       print("مفيش نت.. مش هنحاول نحمل الإعلان");
//       return; // اخرج من الدالة ومتحملش حاجة
//     }
//       print("جاري التنفيذ ✅"); // ضيف د

//     // لو فيه نت، ابدأ التحميل
//     InterstitialAd.load(
//       adUnitId: interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           print("تم تحميل الإعلان بنجاح.. جاري العرض ✅"); // ضيف د
//           ad.show();
//         },
//         onAdFailedToLoad: (error) {
//           print('Interstitial failed: $error');
//         },
//       ),
//     );
//   }
// }
