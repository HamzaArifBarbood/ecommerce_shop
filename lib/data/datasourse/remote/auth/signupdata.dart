import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class SignupData {
  Crud crud=Crud();
  SignupData (this.crud);

 postData(String username,String email,String phone ,String password) async{
  var responce = await  crud.postData(AppLinkes.signUp, {
    "username":username,
    "email":email,
    "phone":phone,
    "password":password
  });
  return responce.fold((l) => l, (r) => r);
 }
}