import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/controller/onbordingcontroller.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/data/datasourse/static/static.dart';

class CustomSliderOnBording extends GetView<OnbordingControllerImp> {
  const CustomSliderOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.controller,
      onPageChanged: (value) {
        controller.onChangePage(value);
      },
      itemCount: onbordingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            onbordingList[index].title!,
            style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: AppColors.balck) ,
          ),
          const SizedBox(
            height: 50,
          ),
          index.isEven
              ? Image.asset(
                  onbordingList[index].image!,
                  fit: BoxFit.fill,
                  height: 260,
                  width: 250,
                )
              : Container(
                  
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onbordingList[index].body!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
            height: 2,
            fontSize: 16,
            color: AppColors.grey,
            fontWeight: FontWeight.bold) ,
                  ),
                ),
          const SizedBox(
            height: 40,
          ),
          index.isEven
              ? Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onbordingList[index].body!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
            height: 2,
            fontSize: 16,
            color: AppColors.grey,
            fontWeight: FontWeight.bold),
                  ),
                )
              : Image.asset(
                  onbordingList[index].image!,
                  fit: BoxFit.fill,
                  height: 260,
                  width: 250,
                ),
        ],
      ),
    );
  }
}
