import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.textbutton, this.onPressed});

  @override

  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      textColor: Colors.black,
      onPressed: onPressed,
      child:  Text(
        textbutton,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
