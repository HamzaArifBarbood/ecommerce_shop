<?php
include "../connect.php";
$userid=filterRequest("userid");
getAllData("orders", "order_userid=$userid");