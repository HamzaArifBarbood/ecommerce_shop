import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      child: MaterialButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColors.primaryColor,
        textColor: Colors.white,
        
        child: Text(textbutton),
      ),
    );
  }
}
