import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/addressData.dart';
import 'package:mvc_commers/data/datasourse/remote/checkoutData.dart';
import 'package:mvc_commers/data/model/addressmodel.dart';

class CheckOutController extends GetxController{
String? paymentMethod;
String? delvirayType;
int shippingAddressid=0;

late int couponid;
late int discountCoupon;
late String priceOrder;




AddressData addressData=AddressData(Get.find());
List<AddressModel> addressModel=[];
Myservices myservices=Get.find();
StatusRequest statusRequest=StatusRequest.none;
CheckoutData checkoutData= CheckoutData(Get.find());



choosePaymentMethod(val){
  paymentMethod =val;
  
  update();

}
chooseDeliveryType(val){
  delvirayType =val;
  update();
 
}
chooseShippingAddres(val){
  shippingAddressid =val;
  update();
}



getShippingAddres()async{
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

checkout()async{
  if(paymentMethod==null) return Get.snackbar("Error", "Please Select a payment method");
  if(delvirayType==null) return Get.snackbar("Error", "Please Select a delivery type");
  if(delvirayType=="0"){
    if(shippingAddressid==0) return Get.snackbar("Error", "Please Select a shipping Addess");
  }
Map data={
 "userid":myservices.sharedPreferences.getInt("id").toString(),
 "addressid": shippingAddressid.toString(),
 "paymentmethod":paymentMethod,
 "ordertype":delvirayType,
 "orderprice":priceOrder.toString(),
 "pricedelivery":"908",
 "couponid":couponid.toString(),
 "coupondiscount":discountCoupon.toString()
};
    statusRequest = StatusRequest.loading;
    
    update();
    
    var response = await checkoutData.checkOut(
        data
      );
      print(shippingAddressid);
    statusRequest = handlingData(response);
   print("response: $response and statusRequest: $statusRequest");
    
    if (statusRequest == StatusRequest.success) {
       print("success one");
      if (response['status'] == 'success') {
        print("success tow");
         Get.offAllNamed(AppRoutes.mainhomescreen);
         Get.snackbar("Success", "the order was successfully"); 
     
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
    }
    update();

}
@override
  void onInit() {
   getShippingAddres();
   
  couponid=Get.arguments['couponid'];
  discountCoupon=Get.arguments['discountCoupon']; 
  priceOrder=Get.arguments['PriceOrder'];
  
  print("couponid: $couponid and tPriceOrder: $priceOrder  and discountCoupon: $discountCoupon" );


    super.onInit();
  }
}