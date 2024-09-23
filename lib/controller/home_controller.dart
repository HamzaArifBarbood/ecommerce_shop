import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/homeData.dart';

abstract class HomeController extends GetxController{
  initilData();
  getData();
  goToItem(List categories,int selectedCat);
 
}
class HomeControllerimp extends HomeController{
Myservices myservices=Get.find();

int? id    ;
String? name  ;
String? email ;
String? phone ;
String? lang;
@override
  void onInit() {
     getData();
    initilData();
    super.onInit();
  }
  
  @override
  initilData() {
  id   =  myservices.sharedPreferences.getInt('id');
  name =  myservices.sharedPreferences.getString('username');
  email=  myservices.sharedPreferences.getString('email');
  phone=  myservices.sharedPreferences.getString('phone');
  lang=myservices.sharedPreferences.getString("lang");
  }
    HomeData homeData =HomeData(Get.find());
  StatusRequest statusrequest=StatusRequest.none;
  List categories =[];
  List items =[];
  
  @override
  getData()async {
    statusrequest = StatusRequest.loading;
    
    var response = await homeData.getData();
  
    update();
    statusrequest = handlingData(response);

    
    if (statusrequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response["items"]);
        update();
      } else {
        return StatusRequest.nodata;
      }
    }
    
    
  }
  
  @override
  goToItem(List categories,int selectedCat) {
   Get.toNamed(AppRoutes.itemsscreen,arguments: {
    "categories": categories,
    "selectedCat": selectedCat
   } );
   
  }
  
  
}
