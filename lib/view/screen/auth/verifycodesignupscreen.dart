import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/auth/verifycodesignup_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/view/widget/auth/customtextbodyauth.dart';
import 'package:mvc_commers/view/widget/auth/customtexttitleauth.dart';

class VerifyCodeSignUpScreen extends StatelessWidget {
  const VerifyCodeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControlleImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '30'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.grey),
                
          ),
        ),
        body: GetBuilder<VerifyCodeSignUpControlleImp>(
          builder: (controller) {
            return HandlingDataRequest(statusrequest: controller.statusrequest, widget:Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: ListView(
                children: [
                  CustomTextTitleAuth(textTitlel: '31'.tr),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextBodyAuth(textBody: "${'43'.tr} ${controller.email}"),
                  const SizedBox(
                    height: 55,
                  ),
                  OtpTextField(
                    
                    numberOfFields: 5,
                    autoFocus: true,
                    //borderColor: Colors.red,
                    enabledBorderColor: AppColors.balck,
                     borderRadius: BorderRadius.circular(10),
                     showFieldAsBox: true,
                  
                    focusedBorderColor:Colors.teal ,
                    cursorColor: Colors.teal,
                    disabledBorderColor: AppColors.grey,
                    onCodeChanged: (String code) {},
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                 
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ));
          }
        ));
  }
}
