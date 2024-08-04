import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/localization/changelocal.dart';
import 'package:mvc_commers/view/widget/languageWidget/custombuttonlang.dart';

class Languagescreen extends GetView<LocaleController> {
  const Languagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1'.tr,style: Theme.of(context).textTheme.headlineMedium,),
          CustomButtonlang(textbutton: 'ar', onPressed: () {
            controller.changeLang('ar');
            Get.toNamed(AppRoutes.onBoarding);
          },),
          CustomButtonlang(textbutton: 'en', onPressed: () {
             controller.changeLang('en');
              Get.toNamed(AppRoutes.onBoarding);
          },),
          
        ],
      ),
    );
  }
}