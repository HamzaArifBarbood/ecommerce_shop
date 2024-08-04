import 'dart:io';

import 'package:get/get.dart';

Future<bool> alertExitApp(){
   Get.defaultDialog(
    title: 'تنبيه',
    middleText: 'هل تريد الخروج من التطبيق',
    textCancel: 'إلغاء',
    textConfirm: 'نعم',
    onConfirm: () {
      exit(0);
    },
    onCancel: () {
      Get.back();
    },

  );
  return Future.value(true);
}