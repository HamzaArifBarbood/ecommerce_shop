import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/isfavorite_controller.dart';
import 'package:mvc_commers/controller/items_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/core/functions/translateDatabase.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';

class CustomItemsCard extends GetView<itemsControllerImp> {
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
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 3.1, left: 6, right: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                    tag: itemsModel.itemId.toString(),
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
                  style: TextStyle(
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
                      margin: EdgeInsets.only(top: 5.0),
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
                              text: "${itemsModel.itemPrice!}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "\$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: "sans")),
                        ])),
                    GetBuilder<IsFavoriteControllerImp>(
                        builder: (IsFavoriteController) {
                      return IconButton(
                          onPressed: () {
                           
                            if (itemsModel.favorite == 1) {
                              IsFavoriteController
                                  .removeFavorite(itemsModel.itemId.toString());
                              itemsModel.favorite = 0;
                             
                            } else {
                              IsFavoriteController
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
        ));
  }
}
