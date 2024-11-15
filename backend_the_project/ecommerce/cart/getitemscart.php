<?php
include "../connect.php";

$userid=filterRequest("userid");
$data=getAllData("cartview","cart_userid=$userid",null,false);

$stmt=$con->prepare("SELECT COUNT(cartview.cart_itemid) as countitems,COALESCE(SUM(cartview.totalPrice),0)as itemsprice from cartview 
        INNER JOIN users on users.user_id=cartview.cart_userid
        WHERE users.user_id=$userid 
        ");
$stmt->execute();
$count=$stmt->rowCount();
if($count>0){
        $countprice=$stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode(array("status"=>"success","datacart"=>$data,"countprice"=>$countprice));
          
}else{
        echo json_encode(array("status"=>"failure"));

}


        