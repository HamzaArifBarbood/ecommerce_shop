import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerimp controller =Get.put(HomeControllerimp());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("${controller.id}"),
          Text("${controller.name}"),
          Text("${controller.email}"),
          Text("${controller.phone}"),
        ],
      )
    );
  }
}