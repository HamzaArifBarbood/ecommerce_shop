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
import 'package:mvc_commers/view/widget/home/customTitle.dart';
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
                         const CustomAppBar(),
                      
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor),
                                height: 150,
                                width: double.infinity,
                                child: const ListTile(
                                  title: Text("A summer Surprise",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  subtitle: Text("Cashback 20%",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ),
                              Positioned(
                                  top: -20,
                                  right: -20,
                                  child: Container(
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6150),
                                        color: AppColors.secondColor),
                                  ))
                            ],
                          ),
                          
                          CustomTitle(title: "Categories",),
                          
                          Container(
                            height: 60,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    width: 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColors.thirdColor,
                                    ),
                                    child: SvgPicture.network(
                                      "${AppLinkes.imagescategories}/${controller.categories[index]["categorie_image"]}",
                                      colorFilter: ColorFilter.mode(
                                          AppColors.secondColor,
                                          BlendMode.srcIn),
                                    ));
                              },
                            ),
                          ),
                          

                          CustomTitle(title: "Product for you",),
                          
                          Container(
                            height: 120,
                            child: ListView.separated(
                              itemCount: controller.items.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      width: 180,
                                     
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                            "${AppLinkes.imagesitems}/${controller.items[index]["item_image"]}",
                                          ))),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          child: Text(
                                            controller.items[index]["item_name"]
                                            ,
                                            style:
                                                TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                      ));
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: 10,
                                    )
                                ),
                          )
                        ],
                      ),
                    ),
                  ));
            }));
  }
}
