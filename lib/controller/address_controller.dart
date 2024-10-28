import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/data/datasourse/remote/addressData.dart';
import 'package:mvc_commers/data/model/addressmodel.dart';

class AddressController extends GetxController {
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController nameController;
  List<AddressModel> data = [];
  List he=[];
  StatusRequest statusRequest = StatusRequest.none;
  Myservices myservices = Get.find();
  AddressData addressData = AddressData(Get.find());

  late GlobalKey<FormState> formState;
  clearTexetForm(){
    cityController.text="";
    streetController.text="";
    nameController.text="";
  }
  getAddress() async {
    data.clear();
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
        data.addAll(responseData.map(
          (e) => AddressModel.fromJson(e),
        ));
     
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  addAddress() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addAddressData(
          myservices.sharedPreferences.getInt("id").toString(),
          cityController.text,
          streetController.text,
          nameController.text);
      statusRequest = handlingData(response);
      update;
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.snackbar("عملية الاضافة", "تمت عملية الاضافة بنجاح");
          getAddress();
         Get.offAllNamed(AppRoutes.mainhomescreen);
         
        }
      }
      update();
    }
  }

  editAddress() {}

  deleteAddres(int addressid)async {
 
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.deleteAddressData(
       addressid.toString()
      );
    statusRequest = handlingData(response);

    update;
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
                Get.snackbar("عملية الحذف", "تمت عملية الحذف بنجاح");
  getAddress();
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  validInputMassage(var value, String massage) {
    if (value.isEmpty) {
      return massage;
    }
  }

goToAddAddress(){
  Get.toNamed(AppRoutes.addAddreesscreen);
}
  @override
  void onInit() {
    cityController = TextEditingController();
    streetController = TextEditingController();
    nameController = TextEditingController();
    formState = GlobalKey<FormState>();
    getAddress();
    super.onInit();
  }
  @override
  void dispose() {
    cityController.dispose();
    streetController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
