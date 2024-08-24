<?php
include "connect.php";
$alldata=array();
$categories=getAllData("categories",null,null,false);
$alldata["categories"]=$categories;

$items=getAllData("itemsview","item_discount!=0",null,false);
$alldata["items"]=$items;             
$alldata["status"]="success";             
echo json_encode($alldata);
