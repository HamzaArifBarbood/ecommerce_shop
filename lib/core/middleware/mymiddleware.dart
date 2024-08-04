import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/services/services.dart';

class MyMiddleware extends GetMiddleware{
  int? get priority => 1;
  Myservices myservices=Get.find();
  @override
   RouteSettings? redirect(String? route){
     if(myservices.sharedPreferences.getString('step')=="2"){
      return const RouteSettings(name: AppRoutes.home);
    }
    if(myservices.sharedPreferences.getString('step')=="1"){
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
   }
}