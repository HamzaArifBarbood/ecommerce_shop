import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvc_commers/view/screen/homescreent.dart';

abstract class MainHomePageController extends GetxController {
  changePage(int i);
  
}
class MainhomepageControllerImp extends MainHomePageController {
  List pages=[
   [const HomeScreen(),"Home",Icons.home],
   [const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child: Text("Setting"),)],),"setting",Icons.settings],
   const Spacer(),
   [const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child: Text("favorit"),)],),"favorit",Icons.favorite],
   [const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Center(child:  Text("profil"),)],),"profil",Icons.person],
   
  ];
  int curentPage=0;
  @override
  changePage(int i) {
    curentPage=i;
    print(curentPage);
    update();
  }
  

}