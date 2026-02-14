import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/core/widget/app_bar.dart';
import 'package:musicapp/core/widget/custom_text.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/model/securit_model.dart';
import 'package:musicapp/pages/home/home_views.dart';

class SystemSecret extends StatelessWidget {
  SystemSecret({super.key});
  final listsecurit = SecuritModel.listSecurit;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => const HomeViews(),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: appBarsystem(context),
        backgroundColor: Colors.black,
        // appBar: AppBar_Home(context, null, null),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listsecurit.length,
                  itemBuilder: (context, index) {
                    final item = listsecurit[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomText(
                        text: item.title,
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(item.withOpacity),
                        fontsize:
                            CustomSize().fontsizeSmall(context) * item.fontsize,
                        textAlign: TextAlign.start,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
