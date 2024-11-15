<?php
include "../connect.php";
$itemid=filterRequest("itemid");
$userid=filterRequest("userid");

deleteData("cart","cart_itemid=$itemid AND  cart_userid=$userid AND cart_orderid=0  LIMIT 1 ");
//deleteData("cart","cart_id=(select cart_id from cart where cart_itemid=$itemid AND  cart_userid=$userid  LIMIT 1)   AND cart_orderid=0");