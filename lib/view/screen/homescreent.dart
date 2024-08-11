import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/home_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerimp controller = Get.put(HomeControllerimp());
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: ListView(
              children: [
              Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: IconButton(onPressed: () {},icon: Icon(Icons.search),),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                              hintText: "Find Product",
                              hintStyle: TextStyle(fontSize: 18),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border:  OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                       width: 60,
                        
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),   
                        child: IconButton(
                            onPressed: () {}, icon:  Icon(color: Colors.grey[600],Icons.notifications_active_outlined,size: 30,)),
                      )
                    ],
                  ),
                ),
            SizedBox(height: 10,)
             ,
             Stack(   
                  children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor),
                    height: 150,
                    width: double.infinity,
                    child: const ListTile(
                      title: Text("A summer Surprise",style: TextStyle(color: Colors.white,fontSize: 20)),
                      subtitle:Text("Cashback 20%",style:TextStyle(color: Colors.white,fontSize: 20)) ,
                    ),
                  ),
                  Positioned(top:-20,right: -20, child: Container(width: 160,height:160, decoration: BoxDecoration(borderRadius: BorderRadius.circular(6150), color: AppColors.secondColor),))
                ],)
              ],
            ),
          ),
        ));
  }
}
