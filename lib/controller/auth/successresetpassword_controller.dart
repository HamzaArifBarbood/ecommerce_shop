import 'package:get/get.dart';
import 'package:mvc_commers/core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController{
 
  goToSignIn();  
    
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
 
  @override
  goToSignIn() {
   Get.offAllNamed(AppRoutes.login);
  }
   
  

  @override
  
  @override
  void onInit() {
     
   
    super.onInit();
  }
  @override
  void dispose() {

    super.dispose();
  }
  
 

}