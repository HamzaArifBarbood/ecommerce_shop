import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomCardPaymentMethod extends StatelessWidget {
  final String nameMethod;
  final bool isActiv;
  const CustomCardPaymentMethod({super.key, required this.nameMethod, required this.isActiv});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20),
            
            decoration: BoxDecoration(
              color:isActiv ?AppColors.secondColor: AppColors.thirdColor,
              borderRadius: BorderRadius.circular(10)
              
            ),
            child: Text(nameMethod ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:isActiv? Colors.white:AppColors.secondColor),),)
      ;
  }
}