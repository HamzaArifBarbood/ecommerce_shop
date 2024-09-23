import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/view/widget/customAppBar.dart';
import 'package:mvc_commers/view/widget/homescreen/customtitle.dart';
import 'package:mvc_commers/view/widget/homescreen/customcardhome.dart';
import 'package:mvc_commers/view/widget/homescreen/listcategorieshome.dart';
import 'package:mvc_commers/view/widget/homescreen/listitemshome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: GetBuilder<HomeControllerimp>(
            init: HomeControllerimp(),
            builder: (controller) {
              return HandlingDataVeiw(
                  statusrequest: controller.statusrequest,
                  widget: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: ListView(
                        children: [
                          CustomAppBar(isHidden: false,
                            textsearchfild: "46".tr,
                            onPressedSearch: () {},
                           
                          ),
                           CustomCardHome(
                            title: "47".tr,
                            body:"${'48'.tr} 20%",
                          ),
                           CustomTitle(
                            title: "45".tr,
                          ),
                          const ListCategoriesHome(),
                           CustomTitle(
                            title: "44".tr,
                          ),
                          const ListItemsHome()
                        ],
                      ),
                    ),
                  ));
            }));
  }
}
