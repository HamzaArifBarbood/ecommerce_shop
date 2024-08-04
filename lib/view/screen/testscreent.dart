import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/test_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataVeiw(statusrequest: controller.statusrequest, widget:ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(child: Text("${controller.data[index]}")) ;
            },
          ) );
      },),
    );

  }
}