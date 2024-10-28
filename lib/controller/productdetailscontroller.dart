import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvc_commers/controller/cart_controller.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController{

}
class ProductDetailsControllerImp extends ProductDetailsController{

List subitems=[
  {
    "id":1,
    "name":"Red",
    "active":1
  },
  {
    "id":2,
    "name":"Black",
    "active":0
  },
  {
    "id":3,
    "name":"Yellow",
    "active":0
  },
  {
    "id":4,
    "name":"Blue",
    "active":0
  },
];
StatusRequest statusRequest=StatusRequest.none;
int countitems=0;
CartControllerImp controllerCart= Get.put(CartControllerImp());
 late ItemsModel itemsModel;
 initeData()async{
 
itemsModel= Get.arguments["itemsModel"];
  getcountitems();
 }
 getcountitems()async{
   statusRequest=StatusRequest.loading;
   update();
   countitems= await controllerCart.getCountitems(itemsModel.itemId!);
   statusRequest=StatusRequest.success;
   update();
 }
 @override
  void onInit() {
    initeData();
    
    super.onInit();
  }
}