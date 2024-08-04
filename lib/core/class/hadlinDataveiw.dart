import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:mvc_commers/core/class/statusRequest.dart';
import 'package:mvc_commers/core/constant/imageassets.dart';
import 'package:mvc_commers/core/constant/routes.dart';

class HandlingDataVeiw extends StatelessWidget {
  final StatusRequest statusrequest;
  final Widget widget;
  const HandlingDataVeiw(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
  return  statusrequest == StatusRequest.loading
        ?  Center(child: Lottie.asset(AppImageassets.loading,width:250,height:250),)    
          : statusrequest == StatusRequest.offlinefailure
            ?Center( child: Lottie.asset(AppImageassets.offline,width:250,height:250),)
            : statusrequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageassets.server,width:250,height:250),)
                : statusrequest == StatusRequest.nodata
                    ? const Center(child: Text("no data"),)
                    : widget;
  }
}
class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusrequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
  return  statusrequest == StatusRequest.loading
        ?  Center(child: Lottie.asset(AppImageassets.loading,width:250,height:250),)    
          : statusrequest == StatusRequest.offlinefailure
            ?Center( child: Lottie.asset(AppImageassets.offline,width:250,height:250),)
            : statusrequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageassets.server,width:250,height:250),)
                
                    : widget;
  }
}