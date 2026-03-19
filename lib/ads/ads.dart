import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Adsmode {
   InterstitialAd? _interstitialAd;
   void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8786995035200616/4361844699', // ده الـ Test ID
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (err) => log('خطأ في التحميل: $err'),
      ),
    );
  }

  // الدالة دي بتتحط في كلاس الـ State بتاعك
   void showAdAndNavigate(BuildContext context, Widget target) {
  // 1. تأكد إن الإعلان موجود ومش null
  if (_interstitialAd != null) {
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        loadInterstitialAd(); 
        Navigator.push(context, MaterialPageRoute(builder: (context) => target));
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        // لو الإعلان فشل في العرض، اتخلص منه وانتقل فوراً
        ad.dispose();
        Navigator.push(context, MaterialPageRoute(builder: (context) => target));
      },
    );
    _interstitialAd!.show();
  } else {
    // 2. لو الإعلان null (بسبب الـ No Fill أو المراجعة)، انتقل فوراً
    Navigator.push(context, MaterialPageRoute(builder: (context) => target));
  }
}
}
