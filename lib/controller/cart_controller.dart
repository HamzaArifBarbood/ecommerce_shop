import 'dart:ffi';

import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/cartData.dart';
import 'package:mvc_commers/data/model/cartmodel.dart';

abstract class CartCountroller extends GetxController{
add(int itemid);
delete(int itemid);
getCountitems(int itemid);
getItemsCart();

}
class CartControllerImp extends CartCountroller{

List<CartModel> itemscart=[];
int itemscount=0;
int totalPrice=0;
StatusRequest statusRequest=StatusRequest.none;
CartData cartData=CartData(Get.find());
Myservices myservices=Get.find();
@override
  getItemsCart()async {
    itemscart.clear();
    statusRequest=StatusRequest.loading;
    var response=await cartData.getItemscart( myservices.sharedPreferences.getInt("id").toString());
    statusRequest=handlingData(response);
    update();
    if(statusRequest==StatusRequest.success){
      if(response["status"]=="success"){
        List responseData=response["data"];
      itemscart.addAll(responseData.map((e) =>CartModel.fromJson(e),));
      itemscount=response["countprice"]["countitems"];
      totalPrice=response["countprice"]["itemsprice"];
      }else{
        statusRequest=StatusRequest.nodata;
      }

    }
    update();
    
  }
@override
  add(int itemid) async{
    statusRequest=StatusRequest.loading;
    var response=await cartData.addcart( myservices.sharedPreferences.getInt("id").toString(), itemid.toString());
    statusRequest=handlingData(response);
    update();
    if(statusRequest==StatusRequest.success){
      if(response["status"]=="success"){
        Get.snackbar("إشعار", "تمت إضافة المنتج الى السلة");
      }else{
        statusRequest=StatusRequest.nodata;
      }

    }
    update();
  }
  
  
  @override
  delete(int itemid) async{
    statusRequest=StatusRequest.loading;
    var response=await cartData.deletecart( myservices.sharedPreferences.getInt("id").toString(), itemid.toString());
    statusRequest=handlingData(response);
    update();
    if(statusRequest==StatusRequest.success){
      if(response["status"]=="success"){
        Get.snackbar("إشعار", "تمت إزالة المنتج من السلة");
      }else{
        statusRequest=StatusRequest.nodata;
      }

    }
    update();
  }

  @override
  getCountitems(int itemid)async {
  statusRequest=StatusRequest.loading;
    var response=await cartData.getcountitems( myservices.sharedPreferences.getInt("id").toString(), itemid.toString());
    statusRequest=handlingData(response);
    update();
    if(statusRequest==StatusRequest.success){
      if(response["status"]=="success"){
        int countitems=0;
        countitems=response["data"];
        update();
    return countitems;
      }else{
        statusRequest=StatusRequest.nodata;
      }

    }
   
  }
  @override
  void onInit() {
   getItemsCart();
    super.onInit();
  }
}