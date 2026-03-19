import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:musicapp/cubit/music_cubit.dart';
import 'package:musicapp/model/musicapp.dart';
import 'package:musicapp/pages/splash/splach_view.dart';
import 'package:musicapp/pages/splash/test_ads.dart';
 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize(); // تهيئة الإعلانات عند تشغيل التطبيق
  await Hive.initFlutter();
  // تسجيل الـ Adapter
  Hive.registerAdapter(MusicappAdapter());

  // فتح الـ Box
  await Hive.openBox<Musicapp>('musicapp');
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: false,
    androidStopForegroundOnPause: true,
    androidNotificationIcon: 'mipmap/ic_launcher',
    notificationColor: Colors.blue,
  );
  runApp(BlocProvider(create: (context) => MusicCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.beirutiTextTheme()),
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [Locale('ar', 'EG'), Locale('en', 'US')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: const SplachView(),
      // home: const TestAds(),
    );
  }
}
