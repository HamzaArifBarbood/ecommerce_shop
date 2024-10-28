class AddressModel{
  int? addressid;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  String? addressName;
  double? addressLat;
  double? addressLong;
  AddressModel(this.addressid,this.addressUserid,this.addressCity,this.addressStreet,this.addressName,this.addressLat,this.addressLong);

AddressModel.fromJson(Map<String, dynamic> json){
  addressid=json["address_id"];
  addressUserid=json["address_userid"];
addressCity=json["address_city"];
  addressStreet=json["address_street"];
  addressName=json["address_name"];
  addressLat=json["address_lat"].toDouble() ;
  addressLong=json["address_long"].toDouble();
}
Map<String,dynamic> toJson(){
  Map <String,dynamic> data=Map<String, dynamic>();
 data["address_id"] =addressid;
 data["address_userid"] =addressUserid;
 data["address_city"] =addressCity;
 data["address_street"] =addressStreet;
 data["address_name"] =addressName;
 data["address_userid"] =addressUserid;
 data["address_lat"] =addressLat;
 data["address_long"] =addressLong;
 return data;
}
}