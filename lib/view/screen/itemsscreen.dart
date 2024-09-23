import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/items_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';
import 'package:mvc_commers/view/widget/customAppBar.dart';
import 'package:mvc_commers/view/widget/itemswidget/customCategoriesItems.dart';
import 'package:mvc_commers/view/widget/itemswidget/customitemsCard.dart';

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
                textsearchfild: "46".tr,
                onPressedSearch: () {},
                isHidden: true,
              
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
                  return CustomItemsCard(itemsModel: ItemsModel.fromjson(controller.data[index]),);
                },
              ))
              ],
          ),
        );
    })
    );
  }
}
