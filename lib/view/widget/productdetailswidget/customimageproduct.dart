import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/productdetailscontroller.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class CustomImageProduct extends GetView<ProductDetailsControllerImp> {
 
  const CustomImageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),
              Positioned(
                  top: 40,
                  right: Get.width / 8,
                  left: Get.width / 8,
                  child: Hero(
                      tag: controller.itemsModel.itemId!,
                      child: CachedNetworkImage(
                        height: 200,
                        imageUrl:
                            "${AppLinkes.imagesitems}/${controller.itemsModel.itemImage}",
                        fit: BoxFit.fill,
                      )))
            ],
          );
  }
}