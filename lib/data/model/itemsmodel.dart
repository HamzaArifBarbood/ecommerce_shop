import 'dart:convert';

class ItemsModel {
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemCount;
  String? itemActive;
  String? itemImage;
  String? itemPrice;
  String? itemDiscount;
  String? itemDate;
  String? itemcat;
  String? categorieId;
  String? categorieName;
  String? categorieNameAr;
  String? categorieImage;
  String? categorieDateTime;

  ItemsModel(
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemCount,
      this.itemActive,
      this.itemImage,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemcat,
      this.categorieId,
      this.categorieName,
      this.categorieNameAr,
      this.categorieImage,
      this.categorieDateTime);
  ItemsModel.fromjson(Map<String, dynamic> json) {
    itemId = json["item_id"];
    itemName = json["item_name"];
    itemNameAr = json["item_name_ar"];
    itemDesc = json["item_desc"];
    itemDescAr = json["item_desc_ar"];
    itemCount = json["item_count"];
    itemPrice = json["item_price"];
    itemDiscount = json["item_discount"];
    itemActive = json["item_Active"];
    itemDate = json["item_date"];
    itemcat = json["item_cat"];
    categorieId = json["categorie_id"];
    categorieName = json["categorie_name"];
    categorieNameAr = json["categorie_name_ar"];
    categorieImage = json["categorie_image"];
    categorieDateTime = json["categorie_datetime"];
  }
  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["item_id"]=itemId;
    data["item_name"]=itemName;
    data["item_name_ar"]=itemNameAr;
    data["item_desc"]=itemDesc;
    data["item_desc_ar"]=itemDescAr;
    data["item_count"]=itemCount;
    data["item_price"]=itemPrice;
    data["item_discount"]=itemDiscount;
    data["item_Active"]=itemActive;
    data["item_date"]=itemDate;
    data["item_cat"]=itemcat;
    data["categorie_id"]=categorieId;
    data["categorie_name"]=categorieName;
    data["categorie_name_ar"]=categorieNameAr;
    data["categorie_image"]=categorieImage;
    data["categorie_datetime"]=categorieDateTime;
    return data;
  }
}
