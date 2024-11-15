<?php
include "../connect.php";
$userid=filterRequest("userid");
$addressid=filterRequest("addressid");
$paymentmethod=filterRequest("paymentmethod");
$ordertype=filterRequest("ordertype");
$pricedelivery=filterRequest("pricedelivery");
$orderprice=filterRequest("orderprice");
$couponid=filterRequest("couponid");
$coupondiscount=filterRequest("coupondiscount");
//اذا كان استلام الطلب من المتجر اجعل سعر التوصيل يساوي 0
if($ordertype=="1"){
    $pricedelivery=0;
}

$totalPrice=$orderprice+$pricedelivery;

$now=date("Y-m-d H:i:s");
$countcoupon= getData("coupons","coupon_id='$couponid' AND coupon_expiredate >'$now' AND coupon_count>0  ",null,false);
if($countcoupon>0){
    $totalPrice=$totalPrice-$orderprice*$coupondiscount/100; 
    $stmt=$con->prepare("UPDATE coupons SET coupon_count= coupon_count-1 WHERE coupon_id=$couponid ");
    $stmt->execute(); 

}

$data=array(
    "order_userid"=>$userid,
    "order_addressid"=>$addressid,
    "order_paymentmethod"=>$paymentmethod,
    "order_type"=>$ordertype,
    "order_pricedelivery"=>$pricedelivery,
    "order_price"=>$orderprice,
    "order_totalprice"=>$totalPrice,
    "order_couponid"=>$couponid,
    "order_coupondiscount"=>$coupondiscount,
    
    
);

$count=insertData("orders",$data,false);

if($count>0){
    $stmt=$con->prepare("SELECT max(order_id) FROM orders  ");
   $stmt->execute();
   $maxid=$stmt->fetchColumn();
   $data=array(
    "cart_orderid"=>$maxid
   );
   
   
    updateData("cart",$data,"cart_userid=$userid AND cart_orderid=0");
}