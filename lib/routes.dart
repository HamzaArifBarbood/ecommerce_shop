import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mvc_commers/core/constant/routes.dart';
import 'package:mvc_commers/core/middleware/mymiddleware.dart';
import 'package:mvc_commers/view/screen/auth/forgetPassword/forgetpasswordscreen.dart';
import 'package:mvc_commers/view/screen/auth/verifycodesignupscreen.dart';
import 'package:mvc_commers/view/screen/auth/loginScreen.dart';
import 'package:mvc_commers/view/screen/auth/forgetPassword/resetpasswordscreen.dart';
import 'package:mvc_commers/view/screen/auth/signupscreen.dart';
import 'package:mvc_commers/view/screen/auth/success_signupscreen.dart';
import 'package:mvc_commers/view/screen/auth/forgetPassword/successresetpasswordscreen.dart';
import 'package:mvc_commers/view/screen/auth/forgetPassword/verifycodescreen.dart';
import 'package:mvc_commers/view/screen/homescreent.dart';
import 'package:mvc_commers/view/screen/itemsscreen.dart';
import 'package:mvc_commers/view/screen/languageScreen.dart';
import 'package:mvc_commers/view/screen/mainhomepage.dart';
import 'package:mvc_commers/view/screen/onBoardingScreen.dart';
import 'package:mvc_commers/view/screen/productdetailsscreen.dart';



  List<GetPage<dynamic>>? routes=[
  //GetPage(name:'/' , page: () =>const TestScreen()),
  GetPage(name:'/' , page: () =>const Languagescreen(), middlewares: [MyMiddleware()]),
  GetPage(name:AppRoutes.login , page: () =>LogInScreen()),
  GetPage(name:AppRoutes.forgetPassword , page: () =>ForgetPasswordScreen()),
  GetPage(name:AppRoutes.onBoarding , page: () =>OnBoardingScreen()),
  GetPage(name:AppRoutes.resetPassword , page: () =>ResetPasswordScreen()),
  GetPage(name:AppRoutes.successResetPassword , page: () =>const SuccessResetPasswordScreen()),
  GetPage(name:AppRoutes.successSignUp , page: () =>const SuccessSignUpScreen()),
  GetPage(name:AppRoutes.verifyCodeForgetPassword , page: () =>const VerifyCodeScreen()),
  GetPage(name:AppRoutes.verifyCodeSignUp , page: () =>const VerifyCodeSignUpScreen()),
  GetPage(name:AppRoutes.signUp , page: () =>SignUpScreen()),
  GetPage(name:AppRoutes.mainhomescreen , page: () =>const MainHomePage()),
  GetPage(name:AppRoutes.itemsscreen , page: () =>const ItemsScreen()),
  GetPage(name:AppRoutes.productdetails , page: () => const ProductDetailsScreen()),
 
  ];