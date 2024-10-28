import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/items_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/functions/translateDatabase.dart';
import 'package:mvc_commers/data/model/categoriesmodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriesCard(
            categoriesModel:
                CategoriesModel.fromjson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class CategoriesCard extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  const CategoriesCard({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
     controller.changeCat(categoriesModel.categorieId!);
      } ,
      child: GetBuilder<ItemsControllerImp>(
        builder: (controller) {
          return Container(
            alignment: Alignment.center,
             padding:const EdgeInsets.symmetric(horizontal: 10,),
             
              
              decoration:controller.selectedCat==categoriesModel.categorieId? BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.primaryColor, width: 2))            // borderRadius: BorderRadius.circular(12),
                // color:controller.selectedCat == categoriesModel.categorieId? AppColors.thirdColor: Colors.grey[200],
              ):null,
              child: Text(
            "${translateDatabase(categoriesModel.categorieNameAr, categoriesModel.categorieName)}",
            style: TextStyle(
                fontSize: 13,
                color: AppColors.grey2,
                fontWeight: FontWeight.bold),
          ) );
        }
      ),
    );
  }
}
