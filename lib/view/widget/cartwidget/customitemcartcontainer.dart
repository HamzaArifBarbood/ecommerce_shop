import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/cart_controller.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/core/functions/translateDatabase.dart';
import 'package:mvc_commers/data/model/cartmodel.dart';

class CustomItemCartContainer extends GetView<CartControllerImp> {
 final CartModel cartModel;
   const CustomItemCartContainer({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Container(
                              child: Row(
                                children: [
                                  Expanded(
                                   
                                      child: CachedNetworkImage(
                                          imageUrl:  "${AppLinkes.imagesitems}/${cartModel.itemImage}",height: 70,fit: BoxFit.cover,)),
                                  Expanded(
                                     flex: 2,
                                      child: Container(
                                    child: ListTile(
                                      title: Text(translateDatabase(
                                          cartModel.itemNameAr
                                              .toString(),
                                         cartModel.itemName
                                              .toString())),
                                              subtitle: Text("${cartModel.itemPrice}\$"),
                                    ),
                                  )),
                                  Expanded(
                                     child: Column(
                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                       children: [
                                                       Container(margin: const EdgeInsets.only(bottom: 3),height: 20,child: IconButton(onPressed: ()async{
                                                          await controller.add(cartModel.itemId!);
                                                     
                                                       },visualDensity: VisualDensity.compact, icon: const Icon(Icons.add))),
                                                       Text(cartModel.quantity.toString(),style: const TextStyle(fontFamily: "sana",),),
                                                       Container( height: 20,child: IconButton(onPressed: ()async{
                                                       await controller.delete(cartModel.itemId!);
                                                     
                                                       }, alignment: Alignment.topCenter,visualDensity: VisualDensity.compact,icon: const Icon(Icons.remove))),
                                                     ],),
                                   )
                                ],
                              ),
                            );
  }
}