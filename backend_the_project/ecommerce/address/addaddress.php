<?php
include "../connect.php";

$userid= filterRequest("userid");
$city= filterRequest("city");
$street= filterRequest("street");
$name= filterRequest("name");
$data=array(
    "address_userid"=>$userid,
    "address_city"=>$city,
    "address_street"=>$street,
    "address_name"=>$name,
);
insertData("address",$data);