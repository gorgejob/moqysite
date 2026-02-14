import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/core/widget/custom_text.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/cubit/music_state.dart';
import 'package:musicapp/cubit/music_cubit.dart';
import 'package:musicapp/model/musicapp.dart';

// ignore: must_be_immutable
class ListdatainHome extends StatefulWidget {
  ListdatainHome({super.key, required this.data, required this.index});
  Musicapp data;
  int index;
  @override
  State<ListdatainHome> createState() => _ListdatainHomeState();
}

class _ListdatainHomeState extends State<ListdatainHome> {
  final gorge = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
      child: BlocBuilder<MusicCubit, MusicState>(
        builder: (context, state) {
          final indexs = state.currentIndex;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color:
                  indexs == widget.index
                      // ignore: deprecated_member_use
                      ? Colors.white.withOpacity(0.2)
                      : Colors.black,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: [
                CustomText(
                  textAlign: TextAlign.center,
                  text: widget.data.name,
                  color: Colors.white,
                  fontsize: CustomSize().fontsizeMediam(context) * 0.8,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    context.read<MusicCubit>().changeLike(widget.data);
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 30,

                    color: widget.data.isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
