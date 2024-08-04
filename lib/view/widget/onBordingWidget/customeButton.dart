import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/onbordingcontroller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomeButtonOnBording extends GetView<OnbordingControllerImp> {
  const CustomeButtonOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 50),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 0),
        onPressed: () {
          controller.next();
        },
        color: AppColors.primaryColor,
        textColor: Colors.white,
        child:  Text("18".tr),
      ),
    );
  }
}
