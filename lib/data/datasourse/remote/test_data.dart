import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class TestData{
  Crud crud= Crud();
  TestData(this.crud);

  getdata() async{
    var response=await crud.postData(AppLinkes.test,{});
    print("$response tklfdod");
   return response.fold((l) =>l , (r) => r);
  }
}