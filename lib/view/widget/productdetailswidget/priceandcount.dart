import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class PriceAndCount extends StatelessWidget {
  final  priceProduct; 
  final count; 
  final void Function()? onAdd;
  final void Function()? onRemove;

  const PriceAndCount({super.key, this.priceProduct, this.onAdd, this.onRemove, this.count});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
                   Row(children: [
                    IconButton(visualDensity: VisualDensity.compact,onPressed: onAdd, icon: const Icon(Icons.add)),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      alignment: Alignment.center,
                    width: 50,
                    
                      decoration:  BoxDecoration(
                        border: Border.all(color: AppColors.fourthColor),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("${count}",style: const TextStyle(fontWeight: FontWeight.bold,height: 1.3),),
                    ),
                    IconButton(visualDensity: VisualDensity.compact,onPressed: onRemove, icon: const Icon(Icons.remove)),

                  ],),
                  const Spacer(),
                  Text("${priceProduct}\$",style: TextStyle(fontFamily: "sana" ,fontSize: 20,fontWeight:FontWeight.bold ,color: AppColors.primaryColor),)
                ],);
  }
}