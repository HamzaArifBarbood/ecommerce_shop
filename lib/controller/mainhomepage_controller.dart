import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvc_commers/view/screen/homescreent.dart';
import 'package:mvc_commers/view/screen/myfavoritesScreen.dart';
import 'package:mvc_commers/view/screen/settingsscreen.dart';

abstract class MainHomePageController extends GetxController {
  changePage(int i);
  
}
class MainhomepageControllerImp extends MainHomePageController {
  List pages=[
   [const HomeScreen(),"50".tr,Icons.home ],
   [const SettingsScreen(),"51".tr,Icons.settings],
   const Spacer(),
   [const MyFavoritesScreen(),"52".tr,Icons.favorite],
   [ Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child:  Text("53".tr),)],),"53".tr,Icons.person],
   
  ];
  int curentPage=0;
  @override
  changePage(int i) {
    curentPage=i;
    
    update();

  }
  

}