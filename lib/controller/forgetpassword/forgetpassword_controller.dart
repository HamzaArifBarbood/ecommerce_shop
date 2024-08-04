import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';

import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/datasourse/remote/forgetpassword/checkemaildata.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();

  goToLogin();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());

  StatusRequest statusrequest=StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController emailcontroller;

  @override
  @override
  checkemail() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(emailcontroller.text);

      statusrequest = handlingData(response);
      if (statusrequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.verifyCodeForgetPassword,arguments: {
            'email':emailcontroller.text
          }  );
           print("sacceuss");
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "email is not found");
               print("not found");
        }
      }
      update();

     
    }
  }

  @override
  void onInit() {
    emailcontroller = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    emailcontroller.dispose();

    super.dispose();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
