import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/constant/appTheme.dart';
import 'package:mvc_commers/core/services/services.dart';

class LocaleController extends GetxController{
  Locale? language;
  Myservices myServices = Get.find();
  ThemeData appTheme=themeEnglish;
  changeLang(String langcode){
    Locale locale= Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    appTheme=langcode=='ar'?themeArabic:themeEnglish;
     Get.changeTheme(appTheme);
     Get.updateLocale(locale);
  }
  @override
  void onInit() {
    String? sharedPrefr=myServices.sharedPreferences.getString('lang');
    if(sharedPrefr=='ar'){
      language=Locale('ar');
      appTheme=themeArabic;
    }
    else if(sharedPrefr=='en'){
      language=Locale('en');
      appTheme=themeEnglish;
    }
    else{
       language=Locale(Get.deviceLocale!.languageCode);
       appTheme=themeEnglish;
       
    }
    super.onInit();
  }
}