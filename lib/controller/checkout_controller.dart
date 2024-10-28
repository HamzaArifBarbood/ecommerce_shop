import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/addressData.dart';
import 'package:mvc_commers/data/model/addressmodel.dart';

class CheckOutController extends GetxController{
String? paymentMethod;
String? delvirayType;
int? shippingAddress;

AddressData addressData=AddressData(Get.find());
List<AddressModel> addressModel=[];
Myservices myservices=Get.find();
StatusRequest statusRequest=StatusRequest.none;

choosePaymentMethod(val){
  paymentMethod =val;
  update();

}
chooseDeliveryType(val){
  delvirayType =val;
  update();
 
}
chooseShippingAddres(val){
  shippingAddress =val;
  update();
}
getAdress()async{
addressModel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.getAddessData(
        myservices.sharedPreferences.getInt("id").toString(),
      );
    statusRequest = handlingData(response);

    update;
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response["data"];
        addressModel.addAll(responseData.map(
          (e) => AddressModel.fromJson(e),
        ));
     
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();

}
@override
  void onInit() {
   getAdress();
    super.onInit();
  }
}