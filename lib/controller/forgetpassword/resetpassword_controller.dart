import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/datasourse/remote/forgetpassword/resetpassworddata.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();  
   
}
class ResetPasswordControllerImp extends ResetPasswordController{
ResetPasswordData resetPasswordData=ResetPasswordData(Get.find());
StatusRequest statusrequest=StatusRequest.none;
String? email;
  GlobalKey<FormState>formstate=GlobalKey();
 late TextEditingController passwordcontroller ;
 late TextEditingController rePasswordcontroller    ;
 bool isshowPassword=true;
 bool isshowPassword2=true;
showPassword(){
  isshowPassword=isshowPassword==true?false:true;
  update();
}
showPassword2(){
  isshowPassword2=isshowPassword2==true?false:true;
  update();
}
  
   @override
  goToSuccessResetPassword()async {
    var formData=formstate.currentState;
    if(formData!.validate()){
       if(passwordcontroller.text==rePasswordcontroller.text){
            statusrequest=StatusRequest.loading;
     update();
      var response=await resetPasswordData.postData(email!,passwordcontroller.text)
      
      ;
     
      statusrequest=handlingData(response);
      if(statusrequest==StatusRequest.success){
         if(response['status']=='success'){
             Get.offNamed(AppRoutes.successResetPassword);
         }
         else{
        Get.defaultDialog(title: "Warning", middleText: "Try Again");
      }
          
      }
     update();
       }
       else{
        Get.defaultDialog(title: "Warning", middleText: "Password  not Match");

       }
    
    }
  }

  @override
  resetPassword() {
    // TODO: implement login
    throw UnimplementedError();
  }
  @override
  void onInit() {
     email=Get.arguments['email'];
     print(email);
     passwordcontroller = TextEditingController();
     rePasswordcontroller   = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
passwordcontroller.dispose();
rePasswordcontroller.dispose();
    super.dispose();
  }
  
 

}