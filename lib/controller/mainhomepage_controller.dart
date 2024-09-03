import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvc_commers/view/screen/homescreent.dart';

abstract class MainHomePageController extends GetxController {
  changePage(int i);
  
}
class MainhomepageControllerImp extends MainHomePageController {
  List pages=[
   [const HomeScreen(),"50".tr,Icons.home],
   [ Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child: Text("51".tr),)],),"51".tr,Icons.settings],
   const Spacer(),
   [ Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child: Text("52".tr),)],),"52".tr,Icons.favorite],
   [ Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child:  Text("53".tr),)],),"53".tr,Icons.person],
   
  ];
  int curentPage=0;
  @override
  changePage(int i) {
    curentPage=i;
    print(curentPage);
    update();
  }
  

}