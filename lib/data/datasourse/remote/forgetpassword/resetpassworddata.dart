import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class ResetPasswordData {
  Crud crud=Crud();
  ResetPasswordData (this.crud);

 postData(String email,String password) async{
  var responce = await  crud.postData(AppLinkes.resetpassword, {
    "email":email,
    "password":password
  });
  return responce.fold((l) => l, (r) => r);
 }
}