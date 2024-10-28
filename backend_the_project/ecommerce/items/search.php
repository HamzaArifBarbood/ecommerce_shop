<?php
include "../connect.php";
$searchname=filterRequest("searchname");
$stmt=$con->prepare("SELECT itemsview.*, round( (itemsview.item_price-(itemsview.item_price*itemsview.item_discount/100)),2 )as itempricediscount   from itemsview 
        
        WHERE itemsview.item_name_ar LIKE  '%$searchname%' OR itemsview.item_name LIKE  '%$searchname%' ");
$stmt->execute();
$data= $stmt->fetchAll(PDO::FETCH_ASSOC);;
$count=$stmt->rowCount();
if ($count > 0){
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}