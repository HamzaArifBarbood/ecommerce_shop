import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/cart_controller.dart';
import 'package:mvc_commers/core/class/hadlinDataveiw.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/view/widget/cartwidget/customButtonCart.dart';
import 'package:mvc_commers/view/widget/cartwidget/customitemcartcontainer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: Container
          (
            decoration: BoxDecoration(
              color: AppColors.fourthColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10) )
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:  Column(


              mainAxisSize: MainAxisSize.min,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Price",style: TextStyle(fontSize: 18, color: AppColors.thirdColor ),),
                  Text("900\$",style: TextStyle(fontFamily: "sana",fontSize: 18, color: AppColors.thirdColor ),),
                ],),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Shapping",style: TextStyle( fontSize: 18 , color: AppColors.thirdColor),),
                  Text("899\$",style: TextStyle(fontFamily: "sana",fontSize: 18, color: AppColors.thirdColor ),),
                ],),
                Divider(),
                SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Total Price",style: TextStyle(fontSize: 18, color: AppColors.thirdColor ),),
                  Text("489\$",style: TextStyle(fontFamily: "sana",fontSize: 18 , color: AppColors.thirdColor ),),
                ],),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  child: CustomButtonCart(textbutton: "Place Order", onPressed: () {
                    
                  },),
                ),
             
                ],
            ),
          ),
        ),
        body: GetBuilder<CartControllerImp>(
          builder: (controller) => HandlingDataVeiw(
            statusrequest: controller.statusRequest,
            widget: ListView(
              children: [
               
                Container(
                 
                  child: Row(
                    children: [
                       IconButton(
                          onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back)),
                      const Expanded(
                          child: Text(
                        "My Cart",
                        textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                      )),
                     
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    
                    children: [
                      Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                   alignment: Alignment.center,
                  decoration: BoxDecoration(color:AppColors.thirdColor, borderRadius: BorderRadius.circular(10)),
                child: Text("You Have ${controller.itemscount} Items in Your List",style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.bold),),
                ),
                     ... List.generate(controller.itemscart.length, (index) => Card(
                            child: CustomItemCartContainer(cartModel: controller.itemscart[index]),
                          ),)
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
