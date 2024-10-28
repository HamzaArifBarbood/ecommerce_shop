import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/datasourse/remote/itemsdata.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';

class SearchMixController extends GetxController{
  List<ItemsModel> listItems=[];
  TextEditingController searchController = TextEditingController();
  StatusRequest statusRequest= StatusRequest.none;
ItemsData itemsData=ItemsData(Get.find());
 bool isSearch=false;
 checkSearch(val){
  if(val==""){
    isSearch=false;
  }
  update();
 }

 onSearchItems(){
    listItems.clear();
    isSearch=true;
    searchData();
    update();
    
 }
 
 searchData()async{
   statusRequest =StatusRequest.loading;
  update();
var response=await itemsData.searchData(searchController.text);
statusRequest=handlingData(response);
if(statusRequest==StatusRequest.success){
  if(response["status"]=="success"){
  List responseData=response['data'];
  listItems.addAll(responseData.map((e) =>ItemsModel.fromjson(e) ,));

  }else{
    statusRequest=StatusRequest.nodata;
  }
}
update();
 }
}