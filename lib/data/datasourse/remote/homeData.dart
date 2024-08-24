import 'dart:ffi';

import 'package:get/get.dart';
import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinkes.homepage,{});
    return response.fold((l) => l, (r) => r,);
  }
}