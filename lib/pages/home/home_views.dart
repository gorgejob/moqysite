import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/core/widget/colors.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/cubit/music_cubit.dart';
import 'package:musicapp/pages/home/widget/controller_widget.dart';
import 'package:musicapp/pages/splash/widget/image_splach.dart';
import 'package:musicapp/pages/splash/widget/title_splach.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> with WidgetsBindingObserver {
  final player = AudioPlayer();
  // ignore: prefer_typing_uninitialized_variables
  late MusicCubit gorgeww;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    gorgeww = context.read<MusicCubit>(); // تفعيل مراقب الحالة
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // بمجرد أن يخرج المستخدم من التطبيق (الذهاب للقائمة الرئيسية أو قفل الهاتف)
    if (state == AppLifecycleState.detached) {
      context.read<MusicCubit>().stop();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
            right: 0,
            left: 0,
            top: size.height(context) * 0.1,
            child: const ImageSplach(),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: size.height(context) * 0.45,
            child: const Column(children: [Logo(), ControllerWidget()]),
          ),
        ],
      ),
    );
  }
}
