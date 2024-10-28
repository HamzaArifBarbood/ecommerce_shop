import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/myfavorite_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/sharsed/customAppBar.dart';
import 'package:mvc_commers/view/widget/myfavoriteswedgite/customefavoriteitmecard.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(MyFavoriteControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
          
            GetBuilder<MyFavoriteControllerImp>(
              init: MyFavoriteControllerImp(),
              builder: (controller) {
              return HandlingDataVeiw(
                statusrequest: controller.statusrequest,
                widget: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.64),
                  itemCount: controller.itemsfavorite.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomeFavoriteItmecard(
                        myfavoriteModel: controller.itemsfavorite[index]);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
