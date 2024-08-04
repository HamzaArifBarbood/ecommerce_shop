import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/auth/successsignup_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/view/widget/auth/custombuttonauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextbodyauth.dart';
import 'package:mvc_commers/view/widget/auth/customtexttitleauth.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =Get.put(SuccessSignUpControllerImp());
    return 
    Scaffold(
      appBar:  AppBar(
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '39'.tr,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.grey),
          ),
        ),
        body:Container(
          padding: const EdgeInsets.all(15),
          child:Column(
            children: [
              Center(child: Icon(Icons.check_circle_outline_outlined,size: 200,color: AppColors.primaryColor,)),
              CustomTextTitleAuth(textTitlel: '41'.tr),
              CustomTextBodyAuth(textBody: '42'.tr),
              const Spacer(),
              Container(
              width: double.infinity,
                child: CustomButtonAuth(textbutton: '40'.tr, onPressed: () {
                  controller.goToSignIn();
                },),
              ),
           
            const SizedBox(height:20,)
            ],
          ) ,
        ) ,
       
    );
  }
}