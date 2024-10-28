import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/cart_controller.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/core/functions/translateDatabase.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';

class CustomItemCartOnSearch extends StatelessWidget {
 final ItemsModel itemsModel;
 final void Function()? onTap;
   const CustomItemCartOnSearch({super.key, required this.itemsModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Card(
        color: Colors.white,
                                child: Row(
                                  children: [
                                    Expanded(
                                     
                                        child: Hero(
                                          tag:  itemsModel.itemId!,
                                          child: CachedNetworkImage(
                                              imageUrl:  "${AppLinkes.imagesitems}/${itemsModel.itemImage}",height: 70,fit: BoxFit.cover,),
                                        )),
                                    Expanded(
                                       flex: 2,
                                        child: Container(
                                      child: ListTile(
                                        title: Text(translateDatabase(
                                            itemsModel.itemNameAr
                                                .toString(),
                                           itemsModel.itemName
                                                .toString())),
                                                subtitle: Text("${itemsModel.itempricediscount}\$"),
                                      ),
                                    )),
                                  
                                  ],
                                ),
                              ),
    );
  }
}