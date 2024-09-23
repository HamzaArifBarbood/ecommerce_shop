import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/favoriteData.dart';
import 'package:mvc_commers/data/datasourse/remote/myfavorite.dart';
import 'package:mvc_commers/data/model/favoritemodel.dart';

abstract class MyFavoriteController extends GetxController {
//setFavorite(id, val);
  getFavorites();
  deleteFromFavorite(int favId);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  List<MyfavoriteModel> itemsfavorite = [];
  List data=[];

  StatusRequest statusrequest = StatusRequest.none;
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  Myservices myservices = Get.find();
  @override
  // setFavorite( id,val){
  // isFavorite[id]=val;
  // update();
  // }
  @override
  getFavorites() async {
    print("object");
    itemsfavorite.clear();
    
    statusrequest = StatusRequest.loading;
    update();

    var response = await myFavoriteData.getFavorites(
      myservices.sharedPreferences.getInt("id").toString(),
    );
  
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response["status"] == "success") {
         List responseData= response["data"];
         itemsfavorite.addAll(responseData.map((e) => MyfavoriteModel.fromJson(e),));
         update();
        print(itemsfavorite.length);
      } 
      else {
        statusrequest=StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  deleteFromFavorite(favId) async {
    await myFavoriteData.deletefromfavorites(favId);
     print(itemsfavorite);
     itemsfavorite.removeWhere((element) => element.favoriteId== favId); 
    print(itemsfavorite.length);
    update();
  }


  @override
  void onInit() {
    getFavorites();
  
    super.onInit();
  }
  
  
}
