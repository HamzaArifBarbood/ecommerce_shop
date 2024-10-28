import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomShippingAddress extends StatelessWidget {
  final String addressName;
  final String addressCity;
  final String addressStreet;
  final bool isActive;
  const CustomShippingAddress({super.key, required this.addressName, required this.addressCity, required this.addressStreet, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
              
                  color:isActive==true?AppColors.secondColor:Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                   
                    title: Text(addressName ,style:  TextStyle(color: isActive==true?Colors.white:AppColors.secondColor,fontWeight: FontWeight.bold),)  ,subtitle: Text("$addressCity-$addressStreet ",style:  TextStyle(color: isActive==true?Colors.white:AppColors.secondColor,fontWeight: FontWeight.bold)),),
                ),
              );
  }
}