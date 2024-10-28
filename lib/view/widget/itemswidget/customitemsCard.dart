import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/isfavorite_controller.dart';
import 'package:mvc_commers/controller/items_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/core/functions/translateDatabase.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class CustomItemsCard extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomItemsCard({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    Get.put(IsFavoriteControllerImp());
    return 
    InkWell(
        onTap: () {
          controller.goToPrudoctDetails(itemsModel);
        },
        child: Container(
          foregroundDecoration:itemsModel.itemDiscount==0?  null: RotatedCornerDecoration.withColor(
            badgePosition: BadgePosition.topStart,
           spanBaselineShift: 2,
            textSpan: TextSpan(children: [
                    const TextSpan(text: "deduct\n", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
          TextSpan(text: "${itemsModel.itemDiscount}",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          const TextSpan(text: "%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
           
            ]),
    color: AppColors.primaryColor,
    badgeSize: const Size(90, 90),
  ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 3.1, left: 6, right: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                      tag: itemsModel.itemId!,
                      child: CachedNetworkImage(
                        height: 140,
                        imageUrl:
                            "${AppLinkes.imagesitems}/${itemsModel.itemImage!}",
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    translateDatabase(
                        itemsModel.itemNameAr!, itemsModel.itemName!),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${"49".tr}3.5",
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          style: TextStyle(
                              color: AppColors.primaryColor, fontFamily: "sans"),
                          children: [
                             TextSpan(
                                text: "${itemsModel.itempricediscount!}\$   ",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                        itemsModel.itemDiscount!=0?  TextSpan(
                                text: "${itemsModel.itemPrice!}\$",
                                style: const TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough)):const TextSpan(),
                          ])),
                      GetBuilder<IsFavoriteControllerImp>(
                          builder: (isFavoriteController) {
                        return IconButton(
                            onPressed: () {
                             
                              if (itemsModel.favorite == 1) {
                                isFavoriteController
                                    .removeFavorite(itemsModel.itemId.toString());
                                itemsModel.favorite = 0;
                               
                              } else {
                                isFavoriteController
                                    .addFavorite(itemsModel.itemId.toString());
          
                                     itemsModel.favorite = 1;
                                
                              }
                            },
                            visualDensity: VisualDensity.compact,
                            icon: Icon(
                              size: 20,
                              itemsModel.favorite == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                            ));
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
