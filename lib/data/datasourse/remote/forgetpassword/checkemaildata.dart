import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class ForgetPasswordData {
  Crud crud=Crud();
  ForgetPasswordData (this.crud);

 postData(String email) async{
  var responce = await  crud.postData(AppLinkes.checkemail, {
    "email":email,
    
  });
  return responce.fold((l) => l, (r) => r);
 }
}