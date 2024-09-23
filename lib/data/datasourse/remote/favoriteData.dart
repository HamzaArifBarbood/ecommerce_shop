import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class FavoriteData{
 Crud crud ;
  FavoriteData(this.crud);
getData(String userid)async{
  var responces=await crud.postData(AppLinkes.itemsfavorite, {
     "userID":userid
  });
  return responces.fold((l) => l, (r) => r);
}
  addFavorite(String userid, String itemid) async{
    var response=await crud.postData(AppLinkes.addfav, {'userid':userid,'itemid':itemid});
    return response.fold((l) => l, (r) => r);
  }
 removeFavorite(String userid, String itemid) async{
    var response=await crud.postData(AppLinkes.removefav, {'userid':userid,'itemid':itemid});
    return response.fold((l) => l, (r) => r);
  }
}