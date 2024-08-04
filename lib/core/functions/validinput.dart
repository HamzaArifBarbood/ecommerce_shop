import 'package:get/get.dart';

validInput(String val ,int max , int min ,type){


  if(type=='username'){
    if(!GetUtils.isUsername(val)){
      return 'اسم المستخدم غير صحيح';
    }
  }
  if(type=='email'){
    if(!GetUtils.isEmail(val)){
      return 'البريد الإلكتروني غير صحيح';
    }
  }
  if(type=='phone'){
    if(!GetUtils.isPhoneNumber(val)){
      return 'رقم الجوال غير صحيح';
    }
  }
  if(val.length > max){
 return 'لا يمكن ان تكون القيمة أكبر من $max';
}
if(val.length < min){
 return 'لا يمكن ان تكون القيمة أصغر من $min';
}
}