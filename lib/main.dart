import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc_commers/binging.dart';
import 'package:mvc_commers/core/constant/AppColors.dart';
import 'package:mvc_commers/core/localization/changelocal.dart';
import 'package:mvc_commers/core/localization/localization.dart';
import 'package:mvc_commers/core/services/services.dart';
import 'package:mvc_commers/routes.dart';
import 'package:mvc_commers/view/screen/auth/loginScreen.dart';
import 'package:mvc_commers/view/screen/languageScreen.dart';
import 'package:mvc_commers/view/screen/onBoardingScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller=Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: Mybinding(),
       getPages: routes,
     
    );
  }
}

