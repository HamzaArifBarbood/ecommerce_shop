import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String textTitlel;
  const CustomTextTitleAuth({super.key, required this.textTitlel});

  @override
  Widget build(BuildContext context) {
    return  Text(
                textTitlel,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              );
  }
}