import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/auth/login_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/functions/alertexitapp.dart';
import 'package:mvc_commers/core/functions/validinput.dart';
import 'package:mvc_commers/view/widget/auth/custombuttonauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextbodyauth.dart';
import 'package:mvc_commers/core/sharsed/customTextForm.dart';
import 'package:mvc_commers/view/widget/auth/customtextsignuporsignin.dart';
import 'package:mvc_commers/view/widget/auth/customtexttitleauth.dart';
import 'package:mvc_commers/view/widget/auth/logoauth.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '2'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColors.grey),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: HandlingDataRequest(statusrequest: controller.statusrequest,
             widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const LogoAuth(),
                  CustomTextTitleAuth(textTitlel: '3'.tr),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextBodyAuth(textBody: '4'.tr),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextForm(
                    valid: (val) {
                      return validInput(val!, 100, 5, 'email');
                    },
                    inputType: TextInputType.emailAddress,
                    lable: '6'.tr,
                    hint: "7".tr,
                    iconData: Icons.email_outlined,
                    mycontroller: controller.emailcontroller,
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) {
                      return CustomTextForm(
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
                          mycontroller: controller.passwordcontroller);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child: Text(
                      '14'.tr,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) {
                      return AnimatedContainer(
                          duration: Duration(seconds: 3),
                          child:
                              controller.statusrequest == StatusRequest.loading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  :  CustomButtonAuth(
                    textbutton: '2'.tr,
                    onPressed: () {
                      controller.login();
                    },
                  ));
                    },
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextSignUpOrSignIn(
                    text: '15'.tr,
                    texttow: '17'.tr,
                    onTap: () {
                      controller.goToSignUp();
                    },
                  )
                ],
              ),
            ),
          )),
        ));
  }
}
