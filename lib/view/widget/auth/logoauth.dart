import 'package:flutter/material.dart';
import 'package:mvc_commers/core/constant/imageassets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageassets.logo,height: 200,);
  }
}