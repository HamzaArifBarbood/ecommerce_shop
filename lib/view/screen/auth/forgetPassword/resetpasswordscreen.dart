import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/forgetpassword/resetpassword_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/functions/validinput.dart';
import 'package:mvc_commers/view/widget/auth/custombuttonauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextbodyauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextformauth.dart';
import 'package:mvc_commers/view/widget/auth/customtexttitleauth.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '33'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.grey),
          ),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) {
            return HandlingDataVeiw(statusrequest: controller.statusrequest, widget:  Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Center(
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      CustomTextTitleAuth(textTitlel: '34'.tr),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextBodyAuth(textBody: '35'.tr),
                      const SizedBox(
                        height: 55,
                      ),
                      GetBuilder<ResetPasswordControllerImp>(
                          builder: (controller) => customTextFormAuth(
                              valid: (val) {
                                return validInput(val!, 15, 5, 'password');
                              },
                              obscurstext: controller.isshowPassword,
                              onTaped: () {
                                controller.showPassword();
                              },
                              inputType: TextInputType.name,
                              lable: '8'.tr,
                              hint: "9".tr,
                              iconData: Icons.lock_outline,
                              mycontroller: controller.passwordcontroller)),
                      GetBuilder<ResetPasswordControllerImp>(
                          builder: (controller) => customTextFormAuth(
                              valid: (val) {
                                return validInput(val!, 100, 5, 'password');
                              },
                              inputType: TextInputType.number,
                              obscurstext: controller.isshowPassword2,
                              onTaped: () {
                                controller.showPassword2();
                              },
                              lable: '37'.tr,
                              hint: "38".tr,
                              iconData: Icons.lock_outline,
                              mycontroller: controller.rePasswordcontroller)),
                               GetBuilder<ResetPasswordControllerImp>(builder: (controller) {
                    return AnimatedContainer(duration: Duration(seconds: 3),
                    child: controller.statusrequest==StatusRequest.loading?Center(child: CircularProgressIndicator(),): 
                   CustomButtonAuth(
                        textbutton: '36'.tr,
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        },
                      ),
                    );
                  },),
                      
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ));
          }
        ));
  }
}
