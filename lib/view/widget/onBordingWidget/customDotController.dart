import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/onbordingcontroller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/data/datasourse/static/static.dart';

class CustomDotControllerOnbording extends StatelessWidget {
  const CustomDotControllerOnbording({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnbordingControllerImp>(builder: (controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
                ...List.generate(onbordingList.length, (index) {
                return AnimatedContainer(duration: const Duration(milliseconds: 900),width: controller.curentPage==index?20:5,
                height: 6,margin: EdgeInsets.only(right: 4),decoration: BoxDecoration(
                  color: AppColors.primaryColor,borderRadius: BorderRadius.circular(90)
                ),);
              },)],),);
  }
}