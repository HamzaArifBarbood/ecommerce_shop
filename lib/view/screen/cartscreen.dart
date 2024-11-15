import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/cart_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/view/widget/cartwidget/customBottomNavigationBarCart.dart';
import 'package:mvc_commers/view/widget/cartwidget/customButtonCart.dart';
import 'package:mvc_commers/view/widget/cartwidget/customitemcartcontainer.dart';

class ItemsCartScreen extends StatelessWidget {
  const ItemsCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart"),),
        bottomNavigationBar:
            GetBuilder<CartControllerImp>(builder: (controller) {
          return CustomBottomNavigationBarCart(
              priceOrders: controller.priceOrders,
              discountCoupon: controller.discountCoupon,
              totalPrice:double.parse( controller.getTotalPrice()),
              shipping: "908",
              onApplyCoupon: () {
                controller.checkCoupon();
              },
              couponController: controller.couponController!);
        }),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataVeiw(
            statusrequest: controller.statusRequest,
            widget: ListView(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.thirdColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "You Have ${controller.itemscount} Items in Your List",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...List.generate(
                        controller.itemscart.length,
                        (index) => Card(
                          child: CustomItemCartContainer(
                              cartModel: controller.itemscart[index]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
