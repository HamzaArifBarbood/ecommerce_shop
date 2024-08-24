import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 8),
                            child: Text(
                              title,
                              style: TextStyle(
                                  color: AppColors.secondColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
  }
}