import 'package:get/get.dart';
import 'package:mvc_commers/core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController{
 
  goToSignIn();  
    
}
class SuccessSignUpControllerImp extends SuccessSignUpController{
 
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