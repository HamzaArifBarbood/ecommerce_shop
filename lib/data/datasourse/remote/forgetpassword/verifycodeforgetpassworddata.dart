import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class VerifycodeForgetPasswordData {
  Crud crud=Crud();
  VerifycodeForgetPasswordData (this.crud);

 postData(String email,String verifycode) async{
  var responce = await  crud.postData(AppLinkes.verifycodeforgetpassword, {
    "email":email,
    "verifiycode":verifycode
    
  });
  return responce.fold((l) => l, (r) => r);
 }
}