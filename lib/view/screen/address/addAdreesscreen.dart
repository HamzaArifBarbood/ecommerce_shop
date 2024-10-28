import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/address_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/sharsed/customTextForm.dart';
import 'package:mvc_commers/view/widget/cartwidget/customButtonCart.dart';

class AddAdreesScreen extends StatelessWidget {
  const AddAdreesScreen({super.key});

  @override
  Widget build(BuildContext context) {
  AddressController controller=  Get.put(AddressController());
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Add Adrees'),
        leading: IconButton(onPressed: (){
         controller.clearTexetForm();
          Get.back();
        }, icon: Icon(Icons.arrow_back,)),
      
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GetBuilder<AddressController>(
          builder: (controller) {
            return Form(
              key:controller.formState ,
              child: ListView(
                children: [
                 CustomTextForm(lable: "City", hint: "City", iconData: Icons.location_city, mycontroller:controller.cityController , inputType: TextInputType.name, valid: (val) { return controller.validInputMassage(val ,"لا يمكن ترك الحقل فارغ");}),
                 CustomTextForm(lable: "Street", hint: "Street", iconData: Icons.streetview, mycontroller:controller.streetController , inputType: TextInputType.name, valid: (val) { return controller.validInputMassage(val ,"لا يمكن ترك الحقل فارغ");}),
                 CustomTextForm(lable: "Name", hint: "Name", iconData: Icons.near_me, mycontroller:controller.nameController , inputType: TextInputType.name, valid: (val) { return controller.validInputMassage(val ,"لا يمكن ترك الحقل فارغ");},),
              
                  Padding(padding:  EdgeInsets.symmetric(horizontal: 90),child: CustomButtonCart(textbutton: 'Add Adrees', onPressed: () {controller.addAddress();},))
                  ],
              ),
            );
          }
        ),
      ),
    );
  }
}
