import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class VerifycodeSignupData
{
  Crud crud =Crud();
   VerifycodeSignupData(this.crud);
  postData(String email,String verifycode) async{
    var response= await crud.postData(AppLinkes.verfycodesignup, {
    'email':email,
    'verifiycode':verifycode
    });
    return response.fold((l) => l, (r) => r);
  }
}