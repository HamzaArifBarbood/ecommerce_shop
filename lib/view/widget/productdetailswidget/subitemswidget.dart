import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/productdetailscontroller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class subItems extends GetView<ProductDetailsControllerImp> {
  const subItems({super.key});

  @override
  Widget build(BuildContext context) {
    return    SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                     ...List.generate(controller.subitems.length,(index)=>Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 10),
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                          
                          color:  controller.subitems[index]["active"]==1?AppColors.fourthColor:Colors.white,
                            border: Border.all(
                                width: 1, color: AppColors.fourthColor),
                            borderRadius: BorderRadius.circular(10)),
                        child:  Text("${controller.subitems[index]["name"]}",style:TextStyle(fontWeight:FontWeight.bold,color:controller.subitems[index]["active"]==1?Colors.white:AppColors.fourthColor)),
                      ))

                     
                    ],
                  ),
                )
              ;
  }
}