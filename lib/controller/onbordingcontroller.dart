import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/static/static.dart';

abstract class OnbordingController extends GetxController{
  next();
  onChangePage(int index);
}
class OnbordingControllerImp extends OnbordingController{
  int curentPage=0;
  PageController controller=PageController();
Myservices servises=Get.find();
  @override
  next() {
    curentPage++;
    if(curentPage>onbordingList.length-1){
       servises.sharedPreferences.setString("step", "1");
        Get.offAllNamed(AppRoutes.login);
    }
    else{
          controller.animateToPage(curentPage, duration: Duration(microseconds: 900), curve: Curves.linear);

    }
  }

  @override
  onChangePage(int index) {
   curentPage=index;
   update();
  }


}