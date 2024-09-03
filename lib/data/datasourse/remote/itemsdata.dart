import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class ItemsData{
Crud crud;
    ItemsData(this.crud);
  getData(String catID)async{
    
var response=await crud.postData(AppLinkes.items, {
   "catID":catID
});
return response.fold((l) => l, (r) => r,);
  }
}