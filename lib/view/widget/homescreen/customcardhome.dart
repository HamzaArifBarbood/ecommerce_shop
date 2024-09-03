import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomCardHome extends GetView<HomeControllerimp> {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return   Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor),
                                height: 150,
                                width: double.infinity,
                               
                              ),
                              Positioned(
                                  top: -20,
                                  right:controller.lang=="en"? -20:null,
                                  left: controller.lang=="ar"? -20:null,
                                  child: Container(
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6150),
                                        color: AppColors.secondColor),
                                  )),Positioned(
                                    top: 35,
                                    child: SizedBox(
                                     
                                      width:Get.width ,
                                      child: ListTile(
                                      title: Text( title,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20)),
                                      subtitle: Text(body,
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20)),
                                                                      ),
                                    ),
                                  )
                            ],
                          )
                          ;
  }
}