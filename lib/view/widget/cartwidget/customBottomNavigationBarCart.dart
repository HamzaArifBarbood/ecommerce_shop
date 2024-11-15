import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/cart_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

import 'package:mvc_commers/view/widget/cartwidget/customButtonCart.dart';

class CustomBottomNavigationBarCart extends GetView<CartControllerImp> {
  final double priceOrders;
  final String shipping;
  final double totalPrice;
  final int discountCoupon;
  final TextEditingController couponController;
  final void Function()? onApplyCoupon;

  const CustomBottomNavigationBarCart( {super.key,required this.couponController,required this.priceOrders,required this.shipping,required this.discountCoupon, this.onApplyCoupon, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetBuilder<CartControllerImp>(
                    builder: (controller) {
                   return  controller.couponName!=null?Text("Coupon Code: ${controller.couponName}",style:TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold),) : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(flex: 2, child: TextFormField(
                        controller:couponController ,
                        decoration: const InputDecoration(
                          hintText: "Coupon Code",
                          isDense: true,border: OutlineInputBorder(),contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5)
                        ),
                      )),
                      const SizedBox(width: 10,),
                      Expanded(flex: 1, child: Container(height: 32,child: CustomButtonCart(textbutton: "apply", onPressed:onApplyCoupon,)))
                    ],),
                  );
                  },),
               
const SizedBox(height: 8,),
                  Container
                  (
                    decoration: BoxDecoration(
                      color: AppColors.fourthColor,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10) )
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child:  Column(
                              
                              
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Price",style: TextStyle(fontSize: 18, color: AppColors.thirdColor ),),
                          Text("$priceOrders\$",style: TextStyle(fontFamily: "sana",fontSize: 18, color: AppColors.thirdColor ),),
                        ],),
                  
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Shapping",style: TextStyle( fontSize: 18 , color: AppColors.thirdColor),),
                          Text("$shipping\$",style: TextStyle(fontFamily: "sana",fontSize: 18, color: AppColors.thirdColor ),),
                        ],),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("discountCoupon",style: TextStyle( fontSize: 18 , color: AppColors.thirdColor),),
                          Text("$discountCoupon%",style: TextStyle(fontFamily: "sana",fontSize: 18, color: AppColors.thirdColor ),),
                        ],),
                        const Divider(),
                        const SizedBox(height: 10,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Total Price",style: TextStyle(fontSize: 18, color: AppColors.thirdColor ),),
                          Text("${totalPrice}\$",style: TextStyle(fontFamily: "sana",fontSize: 18 , color: AppColors.thirdColor ),),
                        ],),
                        const SizedBox(height: 10,),
                        Container(
                          width: 300,
                          child: CustomButtonCart(textbutton: "Place Order", onPressed: () {
                              
                           
                            controller.goToCheckOut();
                          },),
                        ),
                     
                        ],
                    ),
                  ),
                ],
              ),
            );
  }
}