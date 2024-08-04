import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/datasourse/remote/auth/veifycodesignupdata.dart';

abstract class VerifyCodeSignUpControlle extends GetxController{
  
  checkCode();
  goToSuccessSignUp(String verifycode);  
    
}
class VerifyCodeSignUpControlleImp extends VerifyCodeSignUpControlle{
  VerifycodeSignupData verifycodeSignupData=VerifycodeSignupData(Get.find());
  StatusRequest statusrequest=StatusRequest.none;

 late String email;
 
  @override
  goToSuccessSignUp(String verifycode )async {
    statusrequest=StatusRequest.loading;
     update();
      var response=await verifycodeSignupData.postData(email,verifycode)
      
      ;
     
      statusrequest=handlingData(response);
      if(statusrequest==StatusRequest.success){
         if(response['status']=='success'){
             Get.offNamed(AppRoutes.successSignUp);
         }
         else{
        
        Get.defaultDialog(title: "Warning", middleText: "verifycode is not correct");
       
        
      }
          
      }
     update();
  
  }
   
  @override
  checkCode() {
    // TODO: implement login
    throw UnimplementedError();
  }
  @override
  void onInit() {
     email=Get.arguments['email'];
    
    super.onInit();
  }
  @override
  void dispose() {

    super.dispose();
  }
  
 

}