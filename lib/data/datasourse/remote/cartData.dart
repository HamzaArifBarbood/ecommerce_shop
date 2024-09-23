import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  addcart(String userid, String itemid )async{
    var response =await crud.postData(AppLinkes.addcart, {
      "userid":userid,
      "itemid":itemid
    });
    return response.fold((l) => l, (r) => r,);
  }
  deletecart(String userid, String itemid )async{
    var response =await crud.postData(AppLinkes.deletecart, {
      "userid":userid,
      "itemid":itemid
    });
    return response.fold((l) => l, (r) => r,);
  }
 getItemscart(String userid)async{
    var response =await crud.postData(AppLinkes.getitemscart, {
      "userid":userid,
  
    });
    return response.fold((l) => l, (r) => r,);
  }
 getcountitems(String userid, String itemid )async{
    var response =await crud.postData(AppLinkes.getcountitmes, {
      "userid":userid,
      "itemid":itemid
    });
    return response.fold((l) => l, (r) => r,);
  }
}