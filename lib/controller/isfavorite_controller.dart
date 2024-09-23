import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/favoriteData.dart';

abstract class IsFavoriteController extends GetxController {
//setFavorite(id, val);
  addFavorite(String itemid);
  removeFavorite(String itemid);
  getData();
}

class IsFavoriteControllerImp extends IsFavoriteController {
  var itemsfavorite = [];
  Map isFavorite = {};
  StatusRequest statusrequest = StatusRequest.none;
  FavoriteData favoriteData = FavoriteData(Get.find());
  Myservices myservices = Get.find();
  @override
  // setFavorite( id,val){
  // isFavorite[id]=val;
  // update();
  // }
  @override
  addFavorite(itemid) async {
    statusrequest = StatusRequest.loading;
    update();

   
    var response = await favoriteData.addFavorite(
        myservices.sharedPreferences.getInt("id").toString(), itemid);

    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "إشعار", message: "تمت الإضافة بنجاح");
      } else {
        statusrequest = StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  removeFavorite(itemid) async {
    statusrequest = StatusRequest.loading;
    update();
    var response = await favoriteData.removeFavorite(
        myservices.sharedPreferences.getInt("id").toString(), itemid);
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.rawSnackbar(title: "إشعار", message: "تم الحذف بنجاح");
      } else {
        statusrequest = StatusRequest.nodata;
      }
    }

    update();
  }

  @override
  getData() async {
    statusrequest = StatusRequest.loading;
    var response = favoriteData
        .getData(myservices.sharedPreferences.getInt("id").toString());
    update();
    statusrequest = handlingData(response);
    if (statusrequest == StatusRequest.success) {
      if (response["status"] == "success") {
        itemsfavorite.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.nodata;
      }
      
    } else {
      statusrequest = StatusRequest.nodata;
    }
    update();
  }

  @override
  @override
  void onInit() {
    super.onInit();
  }
}
