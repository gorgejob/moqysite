
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/cubit/music_cubit.dart';
import 'package:musicapp/pages/home/home_views.dart';
import 'package:musicapp/pages/splash/widget/title_splach.dart';

AppBar appBarHome(BuildContext context ,void Function()? onTap) {
  return AppBar(
    shape: const Border(bottom: BorderSide(color: Colors.white)),
    toolbarHeight: 90,
    backgroundColor: Colors.black,
    title: TextField(
      onChanged: (value) {
        context.read<MusicCubit>().search(value) ; 
      },
      // controller: controller,
      style: TextStyle(
        color: Colors.white,
        fontSize: CustomSize().fontsizeSmall(context) * 1.2,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: "ابحث علي اغنيتك المفضلة",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: CustomSize().fontsizeSmall(context) * 1.2,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder:const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder:const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      cursorColor: Colors.white,
    ),
    actions: [
      GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color:Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child:const Icon(
              Icons.navigate_next_rounded,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
    ],
  );
}
AppBar appBarsystem(BuildContext context ,) {
  return AppBar(
    shape: const Border(bottom: BorderSide(color: Colors.white)),
    toolbarHeight: 90,
    backgroundColor: Colors.black,
    title: const Logo(),
    actions: [
      GestureDetector(
        onTap: () async{
          await Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeViews()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color:Colors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child:const Icon(
              Icons.navigate_next_rounded,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
    ],
  );
}
