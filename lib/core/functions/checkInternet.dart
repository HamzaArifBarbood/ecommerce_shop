import 'dart:io';

checkInternet() async{
  try{
    
    var response= await InternetAddress.lookup('google.com');
    
   if(response.isNotEmpty && response[0].rawAddress.isNotEmpty){
    
    return true;
  }
 
  }
 on SocketException catch (_){
     print("internet exeption");
    return false;
  }
 
}