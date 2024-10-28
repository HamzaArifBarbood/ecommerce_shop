import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomCardDeliveryType extends StatelessWidget {
  final String imageName;
  final String title;
  final bool isActive;  
  const CustomCardDeliveryType({super.key, required this.imageName, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondColor ,width: 1),
                  borderRadius: BorderRadius.circular(10),color:isActive? AppColors.secondColor:null
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                     Expanded(child: Image.asset(imageName,color:isActive? Colors.white:null,)) ,
                  Text(title ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:isActive? Colors.white:AppColors.secondColor),),     
                ],),
              )
            
          ;
  }
}