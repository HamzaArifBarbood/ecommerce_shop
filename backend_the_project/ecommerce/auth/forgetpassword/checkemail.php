<?php
include "../connect.php";
$email=filterRequest("email");
$verifiycode=rand(10000,99999);
$stmt=$con->prepare("SELECT * FROM users WHERE user_email='$email' ");
$stmt->execute();
$count=$stmt->rowCount();
if($count>0){
    $data= array(
     "user_verfiycode"=>$verifiycode
    );
    updateData('users',$data,"user_email='$email'");
 }
 else{
     printFailure("user not found");
 }
