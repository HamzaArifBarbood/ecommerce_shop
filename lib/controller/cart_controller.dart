import 'dart:ffi';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/cartData.dart';
import 'package:mvc_commers/data/model/cartmodel.dart';
import 'package:mvc_commers/data/model/couponModel.dart';

abstract class CartCountroller extends GetxController{
add(int itemid);
delete(int itemid);
getCountitems(int itemid);
getItemsCart();
resetVarCart();
refreshPage();

}
class CartControllerImp extends CartCountroller{

List<CartModel> itemscart=[];
int itemscount=0;
double priceOrder=0.0;
double totalPrice=0.0;

StatusRequest statusRequest=StatusRequest.none;
CartData cartData=CartData(Get.find());
Myservices myservices=Get.find();

TextEditingController? couponController;
CouponModel? couponModel;
int discountCoupon=0;
String? couponName;

@override
  resetVarCart() {
  itemscount=0;
   priceOrder=0.0;
  itemscart.clear();
  }
goToCheckOut(){
   
  if(itemscart.isEmpty){
    Get.snackbar("إشعار"," السلة فارغة");
  }else{
     Get.toNamed(AppRoutes.checkoutScreen);
  }
}
  @override
  refreshPage()async {
  resetVarCart();
  getItemsCart();
  
  }
@override
  getItemsCart() async {
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await cartData.getItemscart( myservices.sharedPreferences.getInt("id").toString());
    statusRequest=handlingData(response);
    
    
    if(statusRequest==StatusRequest.success){
      if(response["status"]=="success"){
        if(response['datacart']['status']=="success"){
                    List responseData=response["datacart"]['data'];
      itemscart.addAll(responseData.map((e) =>CartModel.fromJson(e),));
      itemscount=response["countprice"]["countitems"];
      priceOrder= ( response["countprice"]["itemsprice"]).toDouble() ;
      print(priceOrder);
        }
     
      }else{
        statusRequest=StatusRequest.nodata;
      }

    }
    update();
    
  }
@override
  add(int itemid) async{
    statusRequest=StatusRequest.loading;
update();
    var response=await cartData.addcart( myservices.sharedPreferences.getInt("id").toString(), itemid.toString());
    statusRequest=handlingData(response);
    
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
    update();
    var response=await cartData.deletecart( myservices.sharedPreferences.getInt("id").toString(), itemid.toString());
    statusRequest=handlingData(response);
    
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
  update();
    var response=await cartData.getcountitems( myservices.sharedPreferences.getInt("id").toString(), itemid.toString());
    statusRequest=handlingData(response);
    
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
  getTotalPrice(){
    return   ( priceOrder - priceOrder *discountCoupon/100).toStringAsFixed(2);
  }
  
checkCoupon()async {

  update();
    var response=await cartData.checkCouponData(couponController!.text);
    statusRequest=handlingData(response);
    print(statusRequest);
    
    if(statusRequest==StatusRequest.success){
      print(response["status"]);
      if(response["status"]=="success"){

        couponModel=CouponModel.fromJson(response["data"]) ;
        discountCoupon=couponModel!.couponDiscount!;
        
        couponName=couponModel!.couponName;
             
      }else{
      discountCoupon=0;
      couponName=null;
      }
       
}

 update();

}
@override
  void onInit() {
     couponController =TextEditingController();
    getItemsCart();
    super.onInit();
  }
}