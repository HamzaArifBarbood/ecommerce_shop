import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return   Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.primaryColor),
                                height: 150,
                                width: double.infinity,
                                child:  ListTile(
                                  title: Text( title,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                  subtitle: Text(body,
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
                          )
                          ;
  }
}