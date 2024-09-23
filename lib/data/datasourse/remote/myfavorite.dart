import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class MyFavoriteData{
 Crud crud ;
  MyFavoriteData(this.crud);
getFavorites(String userid)async{
  var responces=await crud.postData(AppLinkes.itemsfavorite, {
     "userID":userid
  });
  return responces.fold((l) => l, (r) => r);
}
 
 deletefromfavorites( int favoriteid) async{
    var response=await crud.postData(AppLinkes.deletefromfavorites, {'favoriteid':favoriteid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}