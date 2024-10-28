import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/settings_controller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/constant/imageassets.dart';

class  SettingsScreen extends StatelessWidget {
  const  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: GetBuilder<SettingControllerImp>(
        init: SettingControllerImp(),
        builder: (controller) {
          return ListView(
          
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: Get.width/2,
                    decoration: BoxDecoration(color: AppColors.primaryColor),
                 
                  ),
                  Positioned
                  (
                    bottom:- 20,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImageassets.administrator),
                      ),
                    ),
                  ),
                 
                ],
              ),
               SizedBox(height:20),
                 Card(child: ListTile(  title: Text("تفعيل الاشعارات"),trailing: Switch(value: true, onChanged: (value) { },),)),
                 Card(child: ListTile(title: Text("الاتصال"),trailing:Icon(Icons.phone),)),
                 Card(child: ListTile(onTap: () {
                   controller.goToAddAddrees();
                 }, title: Text("العنوان"),trailing:Icon(Icons.phone),)),
                 Card(child: ListTile(title: Text("حول"),trailing: Icon(Icons.info),)),
                 Card(child: ListTile(onTap: () {
                  controller.logout();
                   
                 }, title: Text("خروج"),trailing: Icon(Icons.exit_to_app),)),
          
            ],
          );
        }
      ),
    );
  }
}