import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/onbordingcontroller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/view/widget/onBordingWidget/customDotController.dart';
import 'package:mvc_commers/view/widget/onBordingWidget/customSlider.dart';
import 'package:mvc_commers/view/widget/onBordingWidget/customeButton.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put( OnbordingControllerImp());
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body:const SafeArea(
        
        child: Column(children: [
          Expanded(
            flex: 2,
            child: CustomSliderOnBording()
          ,
          ),
          
          Expanded(
            flex: 1,
            child: Column(children: [
              Spacer(flex: 1,),
                CustomDotControllerOnbording(),
                 Spacer(flex: 2,),
                 CustomeButtonOnBording()
              
            ],),
          )
        ],)
         
        
      ),
    );
  }
}