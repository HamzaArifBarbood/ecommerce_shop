import 'package:get/get.dart';
import 'package:mvc_commers/core/services/services.dart';

class HomeController extends GetxController{

}
class HomeControllerimp extends HomeController{
Myservices myservices=Get.find();

int? id    ;
String? name  ;
String? email ;
String? phone ;

@override
  void onInit() {
  id   =  myservices.sharedPreferences.getInt('id');
  name =  myservices.sharedPreferences.getString('username');
  email=  myservices.sharedPreferences.getString('email');
  phone=  myservices.sharedPreferences.getString('phone');
    
    super.onInit();
  }
}
