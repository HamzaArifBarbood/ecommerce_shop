import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mvc_commers/controller/items_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/core/constant/imageassets.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';
import 'package:mvc_commers/view/widget/customAppBar.dart';
import 'package:mvc_commers/view/widget/itemswidget/customCategoriesItems.dart';
import 'package:mvc_commers/view/widget/itemswidget/customitemslist.dart';

class ItemsScreen extends StatelessWidget{
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(itemsControllerImp());
    return Scaffold(
      body: GetBuilder<itemsControllerImp>(builder: (controller) {
  return  Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              CustomAppBar(
                titleappbar: "46".tr,
                onPressedSearch: () {},
                onPressedIcon: () {},
              ),
              const ListCategoriesItems(),
              SizedBox(height: 40,),
               HandlingDataVeiw(statusrequest: controller.statusRequest,widget: 
           GridView.builder(
               shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  
                  
                   childAspectRatio: 0.68,
                  crossAxisSpacing: 8                ),
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomItemsList(itemsModel: ItemsModel.fromjson(controller.data[index]));
                },
              ))
              ],
          ),
        );
    })
    );
  }
}
