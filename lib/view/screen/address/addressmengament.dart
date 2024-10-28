import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/address_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/data/model/addressmodel.dart';

class AddressMengamentScreen extends StatelessWidget {
  const AddressMengamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return GetBuilder<AddressController>(
      builder: (controller) {
        return Scaffold(
        
          floatingActionButton:FloatingActionButton.small(
            shape: CircleBorder(),
            child: Icon(Icons.add),
            backgroundColor: AppColors.primaryColor
            ,onPressed: (){
            
            controller.goToAddAddress();}) ,
          appBar: AppBar(title: const Text("AddressMengament"),),
          body: Padding(padding: const EdgeInsets.all(10),
          child: HandlingDataVeiw(statusrequest: controller.statusRequest, widget: 
              // ListView.builder(
              //   itemCount: controller.he.length,
              //   itemBuilder: (context, index) => ListTile(title: Text(AddressModel.fromJson(controller.he[index]).addressCity!),) ,)
              ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
               return Card(
                 child: ListTile(title:Text(controller.data[index].addressName!),
                  subtitle: Text("${controller.data[index].addressCity}-${controller.data[index].addressStreet}"),
                  trailing: InkWell(onTap: () {
                    controller.deleteAddres(controller.data[index].addressid!);
                  },child: Icon(Icons.delete,color: Colors.red,)),
                  ),
               );
              },)
              ))
          
        );
      }
    );
  }
}