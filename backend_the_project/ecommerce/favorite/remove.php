<?php
include "../connect.php";
$userid=filterRequest("userid");
$itemid=filterRequest("itemid");


deleteData("favorites","favorite_userid=$userid and favorite_itemid=$itemid");
