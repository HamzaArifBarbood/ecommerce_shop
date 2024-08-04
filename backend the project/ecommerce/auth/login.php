<?php
include "../connect.php";
$email=filterRequest("email");
$password=sha1($_POST["password"]);

getAllData('users',"user_email=? AND user_password=? AND user_approve=1",array($email,$password));
?>