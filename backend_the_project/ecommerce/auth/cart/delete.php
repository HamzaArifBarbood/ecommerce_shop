<?php
include "../connect.php";
$itemid=filterRequest("itemid");
$userid=filterRequest("userid");

deleteData("cart","cart_itemid=$itemid AND  cart_userid=$userid LIMIT 1 ");