import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/ads/ads.dart';
import 'package:musicapp/core/widget/app_bar.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/cubit/music_state.dart';
import 'package:musicapp/cubit/music_cubit.dart';
import 'package:musicapp/model/musicapp.dart';
import 'package:musicapp/pages/home/home_views.dart';
import 'package:musicapp/pages/music/widget/container_controller.dart';
import 'package:musicapp/pages/music/widget/list_data.dart';
 
class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> with WidgetsBindingObserver {
  final Adsmode ads = Adsmode();
  List<Musicapp> gorge = Musicapp.music;
  final size = CustomSize();
  late MusicCubit gorgeww;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    gorgeww = context.read<MusicCubit>(); // تفعيل مراقب الحالة
    try {
      ads.loadInterstitialAd();
    } catch (e) {}
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
    return WillPopScope(
      onWillPop: () {
        ads.showAdAndNavigate(context, HomeViews());

        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: appBarHome(context, () {
          ads.showAdAndNavigate(context, HomeViews());
        }),
        // الحل هنا: استخدمنا Column بدل Stack عشان نفصل القائمة عن أزرار التحكم
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<MusicCubit, MusicState>(
                builder: (context, state) {
                  final data = state.ListMusic;
                  if (data == null || data.isEmpty) {
                    return const Center(
                      child: Text(
                        "لا توجد أغاني",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<MusicCubit>().playSelectedMusic(item);
                          context.read<MusicCubit>().play();
                        },
                        child: ListdatainHome(data: item, index: index),
                      );
                    },
                  );
                },
              ),
            ),
            // الـ Controller هيفضل ثابت تحت والقائمة مش هتدخل فيه
            const ContainerController(),
          ],
        ),
      ),
    );
  }
}
