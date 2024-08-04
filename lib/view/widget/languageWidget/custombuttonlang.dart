import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';

class CustomButtonlang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonlang({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child:  Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
