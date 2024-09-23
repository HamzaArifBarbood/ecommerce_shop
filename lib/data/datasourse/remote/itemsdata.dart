import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class ItemsData{
Crud crud;
    ItemsData(this.crud);
  getData(String catID,String userID)async{
    
var response=await crud.postData(AppLinkes.items, {
   "catID":catID,
   "userID":userID
});
return response.fold((l) => l, (r) => r,);
  }
}