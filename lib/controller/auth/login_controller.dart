import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/auth/logindata.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();  
  goToForgetPassword();  
}
class LoginControllerImp extends LoginController{
  GlobalKey<FormState>formstate=GlobalKey();
 late TextEditingController emailcontroller    ;
 late TextEditingController passwordcontroller ;
bool isshowPassword=true;
showPassword(){
  isshowPassword=isshowPassword==true?false:true;
  update();
}
  @override
  goToSignUp() {
     Get.offNamed(AppRoutes.signUp);
  
  }
   @override
  goToForgetPassword() {
   Get.offNamed(AppRoutes.forgetPassword);
  }
  LoginData loginData =LoginData(Get.find());
  StatusRequest statusrequest=StatusRequest.none;
  Myservices myservices=Get.find();
 
  @override
  login()async {
   
    var formData=formstate.currentState;
    if(formData!.validate()){
      statusrequest=StatusRequest.loading;
       update();
      var response=await loginData.postData( emailcontroller.text,passwordcontroller.text);
     
      statusrequest=handlingData(response);
      if(statusrequest==StatusRequest.success){
        if(response['status']=='success'){
          print(response);
           myservices.sharedPreferences.setInt("id", response["data"]["user_id"]);
           myservices.sharedPreferences.setString("username", response["data"]["user_name"]);
           myservices.sharedPreferences.setString("email", response["data"]["user_email"]);
           myservices.sharedPreferences.setString("phone", response["data"]["user_phone"]);
           myservices.sharedPreferences.setString("step", "2");
           
           Get.offNamed(AppRoutes.mainhomescreen);
        }
        else{

        Get.defaultDialog(title: "Warning", middleText: "Email Or Password Not Found");
       
        statusrequest =StatusRequest.nodata;
      }
          
      }
     update();
    }
    
  }
  @override
  void onInit() {
     emailcontroller   = TextEditingController();
    passwordcontroller = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
emailcontroller.dispose();
passwordcontroller.dispose();
    super.dispose();
  }
  
 

}