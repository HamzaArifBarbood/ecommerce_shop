import 'dart:convert';

import 'package:get/get.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/datasourse/remote/test_data.dart';

class TestController extends GetxController {
  TestData testdata = TestData(Get.find());
  List data = [];
  late StatusRequest statusrequest;
  getdata() async {
    statusrequest = StatusRequest.loading;
   
    var response = await testdata.getdata();

    update();
    statusrequest = handlingData(response);

    if (statusrequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
         update();
      } else {
        return StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
