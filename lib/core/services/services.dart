import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService{
  late SharedPreferences sharedPreferences;
  Future<Myservices> init()async{
  //   await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //   apiKey: 'AIzaSyCWZjiP2CkzDcHCSV75_yKjTB7fLVD0egs',
  //   appId: '1:1077286876589:android:8d12654af2da7910f7dd24',
  //   messagingSenderId: '1077286876589',
  //   projectId: 'mvccommers-66cdf',
  //   storageBucket: 'mvccommers-66cdf.firebasestorage.app',
  // )
  //   );
    sharedPreferences= await SharedPreferences.getInstance();
   return this;
  }
}


initialServices()async{
 await Get.putAsync(() => Myservices().init(),);
}