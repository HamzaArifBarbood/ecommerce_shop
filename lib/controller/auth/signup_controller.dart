import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/datasourse/remote/auth/signupdata.dart';

abstract class SignUpController extends GetxController {
  goToSignIn();
  SignUp();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState>formstate=GlobalKey();
  late TextEditingController userNamecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController phonecontroller;
  late TextEditingController passwordcontroller;

  SignupData signupData = SignupData(Get.find());
   StatusRequest statusrequest=StatusRequest.none;
  List data=[];
bool isshowPassword=true;
showPassword(){
  isshowPassword=isshowPassword==true?false:true;
  update();
}

  @override
  SignUp()async {
    var formData=formstate.currentState;
    if(formData!.validate()){
      statusrequest=StatusRequest.loading;
      update();
      var response=await signupData.postData(userNamecontroller.text,emailcontroller.text,phonecontroller.text,passwordcontroller.text);
      statusrequest=handlingData(response);
      if(statusrequest==StatusRequest.success){
        if(response['status']=='success'){
           Get.offNamed(AppRoutes.verifyCodeSignUp, arguments: {
            'email':emailcontroller.text
           });
        }
        else{

        Get.defaultDialog(title: "Warning", middleText: "Phone Number or Email already exists");
        
        statusrequest =StatusRequest.nodata;
      }
          
      }
     update();
    }
    
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    userNamecontroller = TextEditingController();
       emailcontroller = TextEditingController();
       phonecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
 userNamecontroller.dispose(); 
    emailcontroller.dispose();
    phonecontroller.dispose();
 passwordcontroller.dispose();
    super.dispose();
  }
}


