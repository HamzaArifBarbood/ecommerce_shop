import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/datasourse/remote/forgetpassword/verifycodeforgetpassworddata.dart';

abstract class VerifyCodeForgetPasswordControlle extends GetxController{
  
  checkCode();
  goToResetPassword(String verifycode);  
    
}
class VerifyCodeForgetPasswordControlleImp extends VerifyCodeForgetPasswordControlle{
  VerifycodeForgetPasswordData verifycodeForgetPasswordData=VerifycodeForgetPasswordData(Get.find());
  String? email;
  StatusRequest statusrequest=StatusRequest.none;
  @override
  goToResetPassword(String verifycode)async {
    statusrequest=StatusRequest.loading;
     update();
      var response=await verifycodeForgetPasswordData.postData(email!,verifycode);
     
      statusrequest=handlingData(response);
      
      if(statusrequest==StatusRequest.success){
         
         if(response['status']=='success'){
            
             Get.offNamed(AppRoutes.resetPassword, 
             arguments: {
              'email':email
             });
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