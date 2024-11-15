import 'package:mvc_commers/core/class/crud.dart';
import 'package:mvc_commers/core/constant/applinkes.dart';

class PendingData{
  Crud crud;
  PendingData(this.crud);
  getOrdersData(String userid)async{
    var response= await crud.postData(AppLinkes.pendingorders, 
    {"userid":userid}
    
    );
    return response.fold((l) => l, (r) => r,);
  }
}