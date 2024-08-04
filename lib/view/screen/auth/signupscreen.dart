import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/auth/signup_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/functions/alertexitapp.dart';
import 'package:mvc_commers/core/functions/validinput.dart';
import 'package:mvc_commers/view/widget/auth/custombuttonauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextbodyauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextformauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextsignuporsignin.dart';
import 'package:mvc_commers/view/widget/auth/customtexttitleauth.dart';

class SignUpScreen extends StatelessWidget {
  
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: 
        AppBar(
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '17'.tr,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.grey),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child:  GetBuilder<SignUpControllerImp>(
            builder: (controller) {
              return HandlingDataRequest(statusrequest: controller.statusrequest, widget:Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: Form (
                  key: controller.formstate,
                  child: ListView(
                    children: [
                       CustomTextTitleAuth(textTitlel: '3'.tr),
                      const SizedBox(
                        height: 20,
                      ),
                       CustomTextBodyAuth(
                          textBody:
                              '5'.tr),
                      const SizedBox(
                        height: 55,
                      ),
                      customTextFormAuth(
                        valid: (val) {
                         return validInput(val!,50 , 5, 'username');
                        },
                        inputType: TextInputType.name,
                        lable: '10'.tr,
                        hint: "11".tr,
                        iconData: Icons.person_outline,
                       mycontroller: controller.userNamecontroller,
                      ),
                      customTextFormAuth(
                        valid: (val) {
                        return  validInput(val!, 100, 5, 'email');
                        },
                        inputType: TextInputType.emailAddress,
                        lable: '6'.tr,
                        hint: "7".tr,
                        iconData: Icons.email_outlined,
                       mycontroller: controller.emailcontroller,
                      ),
                      customTextFormAuth(
                        valid: (val) {
                         return validInput(val!, 11, 5, 'phone');
                        },
                        inputType: TextInputType.phone,
                        lable: '12'.tr,
                        hint: "13".tr,
                        iconData: Icons.phone_android_outlined,
                       mycontroller: controller.phonecontroller,
                      ),
                      GetBuilder<SignUpControllerImp>(builder: (controller) => customTextFormAuth(
                        valid: (val) {
                         return validInput(val!, 15, 5, 'password');
                        },
                        obscurstext: controller.isshowPassword ,
                        onTaped:(){ controller.showPassword();} ,
                        inputType: TextInputType.name,
                          lable: '8'.tr,
                          hint: "9".tr,
                          iconData: Icons.lock_outline,
                         mycontroller: controller.passwordcontroller),
                      ),
                      CustomButtonAuth(
                        textbutton: '17'.tr,
                        onPressed: () {
                          controller.SignUp();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                     CustomTextSignUpOrSignIn(text:'16'.tr , texttow: '2'.tr, onTap: (){
                      controller.goToSignIn();
                     })
                    ],
                  ),
                ),
              ));
            }
          )
          ,
        ) 
      );
  }
}
