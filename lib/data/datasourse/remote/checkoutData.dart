import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class CheckoutData{
  Crud crud= Crud();
  CheckoutData(this.crud);

  checkOut(Map data) async{
    var response=await crud.postData(AppLinkes.checkOut,data);
    
   return response.fold((l) =>l , (r) => r);
  }
}