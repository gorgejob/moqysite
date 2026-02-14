import 'package:flutter/material.dart';
import 'package:musicapp/core/widget/custom_text.dart';
import 'package:musicapp/core/widget/font_size.dart';
import 'package:musicapp/model/controller_model.dart';

class ControllerWidget extends StatelessWidget {
  const ControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final listController = ControllerModel.listModel;
    final size = CustomSize();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.builder(
          itemCount: listController.length,
          physics: const NeverScrollableScrollPhysics(),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 10,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: size.height(context) * 0.2,
          ),
          itemBuilder: (context, index) {
            final item = listController[index];

            return GestureDetector(
              onTap: () {
                item.ontap(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: item.color,
                      size: CustomSize().height(context) * 0.05,
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                      text: item.title,
                      color: Colors.white,
                      fontsize: CustomSize().fontsizeMediam(context) * 0.8,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
