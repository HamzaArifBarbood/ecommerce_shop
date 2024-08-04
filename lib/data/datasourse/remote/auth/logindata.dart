import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class LoginData{
  Crud crud= Crud();
  LoginData(this.crud);

  postData(String email ,String password)async{
    var response= await crud.postData(AppLinkes.login, {
     'email':email ,
     'password': password
    });
    return response.fold((l) => l, (r) => r,);
  }
}