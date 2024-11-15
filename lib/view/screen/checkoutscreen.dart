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
  CheckOutController controller=  Get.put(CheckOutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOut"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          onPressed: () {
            controller.checkout();
          },
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
                        controller.choosePaymentMethod("0"); //0=> Cash
                      },
                      child: CustomCardPaymentMethod(
                          nameMethod: "Cash On Delivery",
                          isActiv: controller.paymentMethod == "0"
                              ? true
                              : false))),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                  onTap: () {
                    controller.choosePaymentMethod("1");//1=> cards
                  },
                  child: CustomCardPaymentMethod(
                      nameMethod: "Payment Cards",
                      isActiv:
                          controller.paymentMethod == "1" ? true : false)),
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
                        controller.chooseDeliveryType("0");//0=>Delivery
                        controller.shippingAddressid=0;
                      },
                      child: CustomCardDeliveryType(
                          imageName: AppImageassets.delivery,
                          title: "Delivery",
                          isActive: controller.delvirayType == "0"
                              ? true
                              : false)),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        controller.chooseDeliveryType("1");//1=>Recive
                      },
                      child: CustomCardDeliveryType(
                          imageName: AppImageassets.driveThru,
                          title: "Recive",
                          isActive: controller.delvirayType == "1"
                              ? true
                              : false)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            
              controller.delvirayType == "0"
                  ? Column(
                      children: [
                          Text(
                "Shipping Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondColor,
                    fontSize: 17),
              ),
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
                                isActive: controller.shippingAddressid ==
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
