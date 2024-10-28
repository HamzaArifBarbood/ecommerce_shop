<?php
include "../connect.php";
$userid=filterRequest("userID");

$categoryid=filterRequest("catID");
//getAllData("itemsview","categorie_id=$categoryid");
$stmt= $con->prepare("SELECT itemsview.*,round((itemsview.item_price-(itemsview.item_price*itemsview.item_discount/100)),2) as itempricediscount  , 1 as favorite
from itemsview  inner join favorites on itemsview.item_id = favorites.favorite_itemid  and favorites.favorite_userid = $userid
where categorie_id=$categoryid
union ALL
SELECT itemsview.*, round( (itemsview.item_price-(itemsview.item_price*itemsview.item_discount/100)),2 )as itempricediscount ,0 as favorite
from itemsview
WHERE item_id not in ( SELECT itemsview.item_id from itemsview
            inner join favorites on itemsview.item_id = favorites.favorite_itemid
            and favorites.favorite_userid = $userid) and categorie_id=$categoryid ") ;
            $stmt->execute();
            $count=$stmt->rowCount();
            $data=$stmt->fetchAll(PDO::FETCH_ASSOC);
            if($count>0){
                echo json_encode(array("status"=>"success","data"=>$data));
            }else{
                echo json_encode(array("status"=>"failure"));
            }