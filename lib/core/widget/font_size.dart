import 'package:flutter/material.dart';


class CustomSize {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  // ignore: deprecated_member_use
  double scale(BuildContext context) => MediaQuery.of(context).textScaleFactor;
  double sizetext(BuildContext context) => width(context) / scale(context);

   fontsizeSmall (BuildContext context) => sizetext(context) * 0.04;
   fontsizeMediam(BuildContext context) => sizetext(context) * 0.055;
   fontsizeLarge(BuildContext context) =>  sizetext(context) * 0.08;
}
