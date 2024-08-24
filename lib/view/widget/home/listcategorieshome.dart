import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';
import 'package:mvc_commers/data/model/categoriesmodel.dart';

class ListCategoriesHome extends GetView<HomeControllerimp> {
  
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                            height: 100,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.categories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CategoriesCard(categoriesModel: CategoriesModel.fromjson(controller.categories[index]),);
                              },
                            ),
                          );
  }
}

class CategoriesCard extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoriesCard({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
                                  children: [
                                    Container(
                                        width: 60,
                                        padding: const EdgeInsets.all(10),
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: AppColors.thirdColor,
                                        ),
                                        child: SvgPicture.network(
                                          "${AppLinkes.imagescategories}/${categoriesModel.categorieImage}",
                                          colorFilter: ColorFilter.mode(
                                              AppColors.secondColor,
                                              BlendMode.srcIn),
                                        )),
                                        Text("${categoriesModel.categorieName}",style: TextStyle(fontSize: 13,color: AppColors.balck,fontWeight: FontWeight.bold),),
                                  ],
                                );
  }
}