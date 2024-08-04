import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/functions/validinput.dart';
import 'package:mvc_commers/view/widget/auth/custombuttonauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextbodyauth.dart';
import 'package:mvc_commers/view/widget/auth/customtextformauth.dart';
import 'package:mvc_commers/view/widget/auth/customtexttitleauth.dart';

class ForgetPasswordScreen extends StatelessWidget {
  
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '14'.tr,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.grey),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) {
            return  HandlingDataVeiw(statusrequest: controller.statusrequest!, widget:
             Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    
                     CustomTextTitleAuth(textTitlel: '27'.tr),
                    const SizedBox(
                      height: 20,
                    ),
                     CustomTextBodyAuth(
                        textBody:
                            '28'.tr),
                    const SizedBox(
                      height: 55,
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
                   GetBuilder<ForgetPasswordControllerImp>(builder: (controller) {
                    return AnimatedContainer(duration: Duration(seconds: 3),
                    child: controller.statusrequest==StatusRequest.loading?Center(child: CircularProgressIndicator(),): CustomButtonAuth(
                      textbutton: '29'.tr,
                      onPressed: () {
                        controller.checkemail();
                      },
                    )
                    );
                  },)
                    ,
                    const SizedBox(
                      height: 20,
                    ),
                   TextButton(onPressed: (){controller.goToLogin();}, child: Text('40'.tr))
                   
                    
                  ],
                ),
              ),
            )
        );}
        ));
  }
}
