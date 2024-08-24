import 'package:mvc_commers/core/class/statusRequest.dart';

handlingData(var response ){
 if(response is StatusRequest ){
 return response;
 }
 else{
  return StatusRequest.success;
 }
}