import 'package:flutter/material.dart';

class customTextFormAuth extends StatelessWidget {
  final String lable;
  final String hint;
  final IconData iconData;
  final TextEditingController mycontroller;
  final String? Function(String?)? valid;
  final TextInputType inputType;
  final bool? obscurstext; 
  final Function()? onTaped;
  const customTextFormAuth(
      {super.key, required this.lable, required this.hint, required this.iconData, required this.mycontroller, this.valid, required this.inputType,  this.obscurstext, this.onTaped});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscurstext == null || obscurstext==false? false :true,
        validator:valid ,
        keyboardType: inputType,
        controller: mycontroller,
        decoration: InputDecoration(
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(
                lable,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: InkWell( onTap:onTaped,child:Icon(iconData) ,),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 1))),
      ),
    );
  }
}
