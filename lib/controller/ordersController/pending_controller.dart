import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/orders/pendingData.dart';
import 'package:mvc_commers/data/model/ordermodel.dart';

class PendingOrdersControllerImp extends GetxController{
 List<OrderModel> data=[];

 
StatusRequest statusRequest=StatusRequest.none;
Myservices myservices= Get.find();
PendingData pendingData=PendingData(Get.find());
checkPaymentMethod(val){
  if(val=="0"){
    return "Cash whene recive";
  }else{
    return "Cart Payment";
  }
}
checkDeliveryType(val){
  if(val=="0"){
    return "Delivery";
  }else{
    return "Recive";
  }
}
checkStatusOrder(val){
  if(val=="0"){
    return "await to accepte";
  }else if(val=="1"){
    return "in processings ";
  } else if(val=="2"){
    return "order in away ";
  }
}

getOrders() async{
  print("object");
  statusRequest=StatusRequest.loading;
  update();
  var response= await pendingData.getOrdersData(myservices.sharedPreferences.getInt("id").toString());
print("object2");
 
  statusRequest=handlingData(response);
  print("object");
  update();
  if(statusRequest==StatusRequest.success){
    if(response["status"]=="success"){
   var responseData=response["data"];
   data=responseData.map<OrderModel>((e) => OrderModel.fromJson(e)).toList();

    }
    else{
      statusRequest=StatusRequest.nodata;
    }
  }
  update();
}
@override
  void onInit() {
    getOrders();
    super.onInit();
  }

}