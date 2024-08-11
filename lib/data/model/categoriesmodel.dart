class CategoriesModel{
int? categorieId;
String? categorieName;
String? categorieNameAr;
String? categorieImage;
String? categorieDataTime;
CategoriesModel({this.categorieId ,this.categorieName,this.categorieNameAr,this.categorieImage,this.categorieDataTime});

CategoriesModel.fromjson(Map<String,dynamic> json){
categorieId=    json  ["categorie_id"];
categorieName=  json["categorie_name"];
categorieNameAr=json["categorie_name_ar"];
categorieImage=  json["categorie_image"];
categorieDataTime=json["categorie_datatime"];
}
Map<String,dynamic> tojson(){
  final Map<String,dynamic> data= new Map<String,dynamic>();
  data["categorie_id"]=categorieId;
  data["categorie_name"]=categorieName;
  data["categorie_name_ar"]=categorieNameAr;
  data["categorie_image"]=categorieImage;
  data["categorie_datatime"]=categorieDataTime;
  return data;
}
}