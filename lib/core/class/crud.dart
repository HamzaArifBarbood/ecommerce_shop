import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/functions/checkInternet.dart';

class Crud {

  Future<Either<StatusRequest, Map>> postData(String linkeuri, Map data) async {
    try {
      // if ( await checkInternet()) {
        
        var responce = await http.post(Uri.parse(linkeuri), body: data);
         
       
        if (responce.statusCode == 200 || responce.statusCode == 201) {
          // convert from Json string to Dart Object
          
         
          Map responceBody = jsonDecode(responce.body);
         
        
          return Right(responceBody);
        }
        else {
          
          return const Left(StatusRequest.serverfailure);
        }
      // } 
      // else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    }
     catch (_) {
      
      return const Left(StatusRequest.serverExeception);
    }
  }
}
