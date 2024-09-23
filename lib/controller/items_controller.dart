import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/itemsdata.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
initialData();
changeCat(int catID);
getItems();
goToPrudoctDetails(ItemsModel itemsModel);


}
class itemsControllerImp extends ItemsController{
  List categories=[]; 
  List data=[]; 

 late int selectedCat;
 ItemsData itemsData=ItemsData(Get.find());
StatusRequest statusRequest=StatusRequest.none;
Myservices myservices=Get.find();

@override
  getItems()async {
    data.clear();
   statusRequest=StatusRequest.loading;
   var response= await itemsData.getData(selectedCat.toString(),myservices.sharedPreferences.getInt("id").toString());
   statusRequest=handlingData(response);
  
   update();
   if(statusRequest==StatusRequest.success){
    if(response["status"]=="success"){
      data.addAll(response["data"]) ;
    } else {
      statusRequest=StatusRequest.nodata;
    }
   }
   update();
  }

  @override
  initialData() {
    categories=Get.arguments["categories"];
    selectedCat=Get.arguments["selectedCat"];
    getItems();
  }
  @override
  changeCat(int catID) {
    selectedCat=catID;
    getItems();
    update();
  }
@override
  void onInit() {
   initialData();
    super.onInit();
  }
  
  @override
  goToPrudoctDetails( itemsModel) {
    Get.toNamed(AppRoutes.productdetails,arguments: {
      "itemsModel":itemsModel
    });
  }
  
 
}