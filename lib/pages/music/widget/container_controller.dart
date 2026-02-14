import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/core/widget/custom_text.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/cubit/music_state.dart';
import 'package:musicapp/cubit/music_cubit.dart';

class ContainerController extends StatefulWidget {
  const ContainerController({super.key});

  @override
  State<ContainerController> createState() => _ContainerControllerState();
}

class _ContainerControllerState extends State<ContainerController> {
  final size = CustomSize();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(top: BorderSide(color: Colors.white)),
      ),
      child: const Column(
        children: [
          ListsMusic(),
          Slide(),
          Padding(padding: EdgeInsets.only(bottom: 30.0), child: EndPartPage()),
        ],
      ),
    );
  }
}

class ListsMusic extends StatelessWidget {
  const ListsMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicCubit, MusicState>(
      builder: (context, state) {
        // تعريف القوائم داخل الـ builder للوصول للحالة
        List<Map<String, dynamic>> lists = [
          {
            "name": "كل الاغاني",
            "value": true, // تعبر عن وضع الكل في الكيوبيت
          },
          {
            "name": "المفضلة",
            "value": false, // تعبر عن وضع المفضلة في الكيوبيت
          },
        ];

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              lists.map((item) {
                // التحقق هل هذا الزر هو المختار حالياً؟
                bool isSelected = state.allOrFavorite == item['value'];

                return GestureDetector(
                  onTap: () {
                    // استدعاء التبديل فقط إذا ضغطنا على زر غير المختار حالياً
                    if (!isSelected) {
                      context.read<MusicCubit>().toggleViewMode(item['value']);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      // تغيير اللون ليعرف المستخدم أين يقف
                      color:
                          isSelected
                              // ignore: deprecated_member_use
                              ? Colors.white.withOpacity(0.3)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: CustomText(
                      text: item['name'],
                      // عكس لون النص عند الاختيار
                      color: Colors.white,
                      fontsize: CustomSize().fontsizeMediam(context) * 0.8,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}

class Slide extends StatefulWidget {
  const Slide({super.key});

  @override
  State<Slide> createState() => SlideState();
}

class SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: BlocBuilder<MusicCubit, MusicState>(
          builder: (context, state) {
            final position = state.position ?? Duration.zero;
            final duration = state.duration ?? Duration.zero;
            return Slider(
              thumbColor: const Color.fromARGB(255, 255, 118, 108),
              inactiveColor: Colors.black,
              activeColor: Colors.white,
              value: position.inSeconds.toDouble().clamp(
                0,
                duration.inSeconds.toDouble() > 0
                    ? duration.inSeconds.toDouble()
                    : 0.0,
              ),
              min: 0,
              max:
                  duration.inSeconds.toDouble() > 0
                      ? duration.inSeconds.toDouble()
                      : 1.0,
              onChanged: (value) async {
                context.read<MusicCubit>().seek(
                  Duration(seconds: value.toInt()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class EndPartPage extends StatefulWidget {
  const EndPartPage({super.key});

  @override
  State<EndPartPage> createState() => _EndPartPageState();
}

class _EndPartPageState extends State<EndPartPage> {
  bool playing = false;
  toggle() {
    final cubit = context.read<MusicCubit>();
    final cubits = cubit.state;

    if (cubits.isPlaying!) {
      cubit.pause();
    } else {
      cubit.play();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // زر السابق
        GestureDetector(
          onTap: () => context.read<MusicCubit>().seekToNext(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.skip_next,
                color: Colors.white,
                size: CustomSize().fontsizeMediam(context),
              ),
            ),
          ),
        ),

        const SizedBox(width: 50),

        // زر التشغيل/الإيقاف المؤقت
        BlocBuilder<MusicCubit, MusicState>(
          builder: (context, state) {
            if (state.isPlaying!) {
              playing = state.isPlaying!;
            } else {
              playing = state.isPlaying!;
            }
            return GestureDetector(
              onTap: toggle,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: CustomSize().fontsizeMediam(context) * 1.5,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 50),
        // زر التالي
        GestureDetector(
          onTap: () => context.read<MusicCubit>().seekToPrevious(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.skip_previous,
                color: Colors.white,
                size: CustomSize().fontsizeMediam(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
