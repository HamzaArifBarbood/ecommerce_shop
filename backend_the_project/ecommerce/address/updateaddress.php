<?php
include "../connect.php";

$addressid= filterRequest("addressid");
$city= filterRequest("city");
$street= filterRequest("street");
$name= filterRequest("name");
$data=array(
    "address_city"=>$city,
    "address_street"=>$street,
    "address_name"=>$name,
);
updateData("address",$data,"address_id=$addressid");