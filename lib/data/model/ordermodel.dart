class OrderModel{
  int? orderId;
  int? orderUserid;
  int? orderAddressid;
  int? orderPaymentmethod;
  int? orderType;
  double? orderPrice;
  double? orderPricedelivery;
  double? orderTotalprice;
  int? orderCouponid;
  String? orederDatatime;
  int? orderStatus;
  OrderModel(this.orderId, this.orderUserid, this.orderAddressid,this.orderPaymentmethod,this.orderType,this.orderPrice,this.orderPricedelivery,this.orderTotalprice,this.orderCouponid,this.orederDatatime,this.orderStatus);
  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAddressid = json['order_addressid'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderType = json['order_type'];
    orderPrice = (json['order_price']).toDouble();
    orderPricedelivery = (json['order_pricedelivery']).toDouble();
    orderTotalprice = (json['order_totalprice']).toDouble();
    orderCouponid = json['order_couponid'];
    orederDatatime = json['order_datatime'];
    orderStatus = json['order_status'];
  }
 Map<String,dynamic> tojson(){
  final Map<String,dynamic> data= new Map<String,dynamic>();
  data["order_id"]=orderId;
  data["order_userid"]=orderUserid;
  data["order_addressid"]=orderAddressid;
  data["order_paymentmethod"]=orderPaymentmethod;
  data["order_type"]=orderType;
  data["order_price"]=orderPrice;
  data["order_pricedelivery"]=orderPricedelivery;
  data["order_totalprice"]=orderTotalprice;
  data["order_couponid"]=orderCouponid;
  data["order_datatime"]=orederDatatime;
  data["order_status"]=orderStatus;
  return data;
}
  

}