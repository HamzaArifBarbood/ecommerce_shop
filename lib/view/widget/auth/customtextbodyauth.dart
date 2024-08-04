import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textBody;
  const CustomTextBodyAuth({super.key, required this.textBody});

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    textBody,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ));
  }
}