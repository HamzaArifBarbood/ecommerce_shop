import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String text;
  final String texttow;
  final void Function()? onTap;
  const CustomTextSignUpOrSignIn({super.key, required this.text, required this.texttow,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(text),
                InkWell(
                  onTap: onTap, child: Text(texttow,style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),)
               ],);
  }
}