<?php
include "../connect.php";
$itemid=filterRequest("itemid");
$userid=filterRequest("userid");
$stmt=$con->prepare("SELECT Count(cart_id) AS countitems FROM cart WHERE cart_itemid=$itemid AND cart_userid=$userid AND cart_orderid=0 ");
$stmt->execute();
$data=$stmt->fetchColumn();

$count=$stmt->rowCount();
if($count>0){
    echo json_encode(array("status" => "success","data"=>$data));
}
else{
    echo json_encode(array("status" => "success","data"=>"0"));
}

    

