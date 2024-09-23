import 'package:get/get.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/services/services.dart';

abstract class SettingController extends GetxController{
logout();
}

class SettingControllerImp extends SettingController{
  Myservices myServices =Get.find();
  @override
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
    
   
  }
}