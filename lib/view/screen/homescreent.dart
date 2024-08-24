import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/core/constant/imageassets.dart';
import 'package:mvc_commers/core/functions/handlingdata.dart';
import 'package:mvc_commers/view/widget/home/customAppBar.dart';
import 'package:mvc_commers/view/widget/home/customtitle.dart';
import 'package:mvc_commers/view/widget/home/customcardhome.dart';
import 'package:mvc_commers/view/widget/home/listcategorieshome.dart';
import 'package:mvc_commers/view/widget/home/listitemshome.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

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
                          CustomAppBar(
                            titleappbar: "Find Product",
                            onPressedSearch: () {},
                            onPressedIcon: () {},
                          ),
                          const CustomCardHome(
                            title: "A summer Surprise",
                            body: "Cashback 20%",
                          ),
                          const CustomTitle(
                            title: "Categories",
                          ),
                          const ListCategoriesHome(),
                          const CustomTitle(
                            title: "Product for you",
                          ),
                          const ListItemsHome()
                        ],
                      ),
                    ),
                  ));
            }));
  }
}
