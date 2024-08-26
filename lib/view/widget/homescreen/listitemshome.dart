import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/data/model/itemsmodel.dart';

class ListItemsHome extends GetView<HomeControllerimp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemCard(
                itemsModel: ItemsModel.fromjson(controller.items[index]));
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              )),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemCard({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
     Container(
      padding: EdgeInsets.all(10),
         width: 180,
         decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12),
             ),
         child: Image.network(
               "${AppLinkes.imagesitems}/${itemsModel.itemImage}",
             )),
            Container(
            width: 180,
         padding: const EdgeInsets.all(10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(12),
           color: Colors.black.withOpacity(0.3),
         )),Positioned(
          top: 5,
          left: 8,
          child:
         Text(

            "${itemsModel.itemName}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )
          )
      ],
    );
    
  }
}
