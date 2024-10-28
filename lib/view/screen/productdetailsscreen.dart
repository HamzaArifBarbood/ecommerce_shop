import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/productdetailscontroller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/functions/translateDatabase.dart';
import 'package:mvc_commers/view/widget/productdetailswidget/customimageproduct.dart';
import 'package:mvc_commers/view/widget/productdetailswidget/priceandcount.dart';
import 'package:mvc_commers/view/widget/productdetailswidget/subitemswidget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   ProductDetailsControllerImp controller =Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: MaterialButton(
            onPressed: () async{
             await controller.controllerCart.refreshPage();
              Get.toNamed(AppRoutes.itemsCartscreen);
            },
            child: const Text(
              "Go To Cart",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        init: ProductDetailsControllerImp(),
        builder: (controller) {
        return HandlingDataVeiw(statusrequest: controller.statusRequest, widget: ListView(
          children: [
            CustomImageProduct(),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translateDatabase(controller.itemsModel.itemNameAr,
                        controller.itemsModel.itemName),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.fourthColor),
                  ),
                  PriceAndCount(
                    count: controller.countitems,
                    priceProduct: controller.itemsModel.itempricediscount,
                    onAdd: ()async {
                      
                   await   controller.controllerCart
                          .add(controller.itemsModel.itemId!);
                           controller.getcountitems();
                           
                    },
                    onRemove: ()async{
                      await controller.getcountitems();
                       if(controller.countitems>0){
                                  await controller.controllerCart
                          .delete(controller.itemsModel.itemId!);
                           controller.getcountitems();
                       }
                    
                       
                       
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    translateDatabase(controller.itemsModel.itemDescAr,
                        controller.itemsModel.itemDesc),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(height: 1.7, color: AppColors.grey2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Color",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.fourthColor),
                  ),
                  subItems()
                ],
              ),
            )
          ],
        ));
      }),
    );
  }
}
