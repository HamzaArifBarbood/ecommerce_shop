import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/myfavorite_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/core/functions/translateDatabase.dart';
import 'package:mvc_commers/data/model/favoritemodel.dart';

class CustomeFavoriteItmecard extends GetView<MyFavoriteControllerImp> {
  final MyfavoriteModel myfavoriteModel;
  const CustomeFavoriteItmecard({super.key, required this.myfavoriteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 3.1, left: 6, right: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                    tag: myfavoriteModel.itemId.toString(),
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: CircleBorder(
                          eccentricity: 1,
                          side: BorderSide(width: 1, color: Colors.black)),
                      child: CachedNetworkImage(
                        height: 140,
                        imageUrl:
                            "${AppLinkes.imagesitems}/${myfavoriteModel.itemImage!}",
                        fit: BoxFit.fill,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  translateDatabase(
                      myfavoriteModel.itemNameAr!, myfavoriteModel.itemName!),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
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
                              text: "${myfavoriteModel.itemPrice!}",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "\$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: "sans")),
                        ])),
                   IconButton(
                   visualDensity: VisualDensity.compact,
                   
                   
                    onPressed: () {
                      controller.deleteFromFavorite(
                              myfavoriteModel.favoriteId!);
                   }, icon: Icon(Icons.delete_rounded))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
