import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/mainhomepage_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomItemBottomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData iconData;
  final isactive;
  const CustomItemBottomAppBar(
      {super.key,
      this.onPressed,
      required this.textbutton,
      required this.iconData,
      this.isactive});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainhomepageControllerImp>(builder: (context) {
      return MaterialButton(
        minWidth: 72,
        onPressed: onPressed,
        child: Column(
          children: [
            Icon(
              iconData,
              color: isactive == true ? AppColors.primaryColor : AppColors.grey2,
            ),
            Text(textbutton,style: TextStyle(color: isactive==true?AppColors.primaryColor:AppColors.grey2),)
          ],
        ),
      );
    });
  }
}
