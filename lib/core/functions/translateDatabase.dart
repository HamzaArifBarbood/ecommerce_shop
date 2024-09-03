import 'package:get/get.dart';
import 'package:mvc_commers/core/services/services.dart';

translateDatabase(columnAr,columnEn) {
Myservices myservices=Get.find();
  if(myservices.sharedPreferences.getString("lang")=="ar"){
    return columnAr;
  }
  else{
    return columnEn;
  }
}