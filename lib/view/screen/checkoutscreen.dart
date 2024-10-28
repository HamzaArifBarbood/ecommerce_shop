import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/checkout_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/imageassets.dart';
import 'package:mvc_commers/view/widget/checkoutwidget/customCarddeliverytype.dart';
import 'package:mvc_commers/view/widget/checkoutwidget/customCardpaymentMethod.dart';
import 'package:mvc_commers/view/widget/checkoutwidget/customShippingAddress.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOut"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColors.primaryColor,
          child: Text(
            "data",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<CheckOutController>(builder: (controller) {
          return ListView(
            children: [
              Text(
                "Choose Payment Method",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                  onTap: () {},
                  child: InkWell(
                      onTap: () {
                        controller.choosePaymentMethod("cash");
                      },
                      child: CustomCardPaymentMethod(
                          nameMethod: "Cash On Delivery",
                          isActiv: controller.paymentMethod == "cash"
                              ? true
                              : false))),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("card");
                  },
                  child: CustomCardPaymentMethod(
                      nameMethod: "Payment Cards",
                      isActiv:
                          controller.paymentMethod == "card" ? true : false)),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Choose Delivery Type",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("delivery");
                      },
                      child: CustomCardDeliveryType(
                          imageName: AppImageassets.delivery,
                          title: "Delivery",
                          isActive: controller.delvirayType == "delivery"
                              ? true
                              : false)),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("receipt");
                      },
                      child: CustomCardDeliveryType(
                          imageName: AppImageassets.driveThru,
                          title: "Receipt",
                          isActive: controller.delvirayType == "receipt"
                              ? true
                              : false)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Shipping Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                    fontSize: 17),
              ),
              controller.delvirayType == "delivery"
                  ? Column(
                      children: [
                        ...List.generate(
                          controller.addressModel.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.chooseShippingAddres(
                                  controller.addressModel[index].addressid);
                            },
                            child: CustomShippingAddress(
                                addressName:
                                    controller.addressModel[index].addressName!,
                                addressCity:
                                    controller.addressModel[index].addressCity!,
                                addressStreet: controller
                                    .addressModel[index].addressStreet!,
                                isActive: controller.shippingAddress ==
                                        controller.addressModel[index].addressid
                                    ? true
                                    : false),
                          ),
                        )
                      ],
                    )
                  : Container()
            ],
          );
        }),
      ),
    );
  }
}
