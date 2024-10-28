import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class AddressData{
 final Crud crud;
 AddressData(this.crud);
 addAddressData(String userid,String city, String street,String nameAddress, ) async{

  var response=await crud.postData(AppLinkes.addAddress, {
    "userid":userid,
    "city":city,
    "street":street,
    "name":nameAddress
  });
  
   return response.fold((l) => l, (r) => r);
 }
 deleteAddressData(String addressid )async{
  var response=await crud.postData(AppLinkes.deleteAddress, {
    "addressid": addressid
  });
  return response.fold((l) => l, (r) => r);
 }
 updateAddressData()async{
  var response=await crud.postData(AppLinkes.updateAddress, {
    "address": "address"
  });
  return response.fold((l) => l, (r) => r);
 }
 getAddessData(String userid)async{
  var response=await crud.postData(AppLinkes.getAddress, {
    "userid": userid
  });
  return response.fold((l) => l, (r) => r);
 }
}