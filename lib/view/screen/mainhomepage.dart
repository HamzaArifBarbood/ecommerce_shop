import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/mainhomepage_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/view/widget/mainhomepage/Custombottomappbar.dart';
import 'package:mvc_commers/view/widget/mainhomepage/customitembottomappbar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainhomepageControllerImp());
    return GetBuilder<MainhomepageControllerImp>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(Icons.shopping_basket_outlined,color: Colors.white,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
        bottomNavigationBar:const CustomBottomAppBar(),
        body: controller.pages[controller.curentPage][0],
      );
    });
  }
}