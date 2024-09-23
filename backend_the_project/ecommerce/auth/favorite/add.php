<?php
include "../connect.php";
$userid=filterRequest("userid");
$itemid=filterRequest(requestname: "itemid");
$data=array("favorite_userid"=>$userid,"favorite_itemid"=>$itemid);
insertData("favorites",$data);
