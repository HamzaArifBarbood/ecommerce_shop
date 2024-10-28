<?php
include "../connect.php";
$userid=filterRequest("userID");


getAllData("myfavorites","favorite_userid=$userid");
