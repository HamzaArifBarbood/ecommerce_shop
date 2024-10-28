import 'package:get/get.dart';
import 'package:mvc_commers/controller/auth/signup_controller.dart';
import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/data/datasourse/remote/test_data.dart';

class Mybinding extends Bindings{
  @override
  void dependencies() {
    
   Get.put( Crud());
  }

}