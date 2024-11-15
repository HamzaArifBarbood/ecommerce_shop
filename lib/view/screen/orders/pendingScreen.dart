import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/ordersController/pending_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/data/model/ordermodel.dart';

class OrdersPendingScreen extends StatelessWidget {
  const OrdersPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text("Orders"),),
      body:GetBuilder<PendingOrdersControllerImp>(
        builder: (controller) =>HandlingDataVeiw(
        statusrequest:controller.statusRequest , 
      widget: 
      ListView.builder(
        itemCount: controller.data.length,

        itemBuilder: (context, index) => CustomOrderCard(orderData: controller.data[index]) ,)
      ),)
    );
  }
}

class CustomOrderCard extends GetView<PendingOrdersControllerImp> {
  final OrderModel orderData;
  const CustomOrderCard({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Text("orderId:${orderData.orderId}"),
         Text("paymentmethod:${controller.checkPaymentMethod( orderData.orderPaymentmethod.toString())}"),
         Text("type:${controller.checkDeliveryType(orderData.orderType.toString())}"),
         Text("price:${orderData.orderPrice}"),
         Text("pricedelivery:${orderData.orderPricedelivery}"),
         Text("totalprice:${orderData.orderTotalprice}"),
         Text("status:${controller.checkStatusOrder( orderData.orderStatus.toString())}"),
      ],),
    );
  }
}