<?php
include "../connect.php";
$email=filterRequest("email");
$verifiycode=filterRequest("verifiycode");
$stmt=$con->prepare("SELECT * FROM users WHERE user_email='$email' AND user_verfiycode=$verifiycode");
$stmt->execute();
$count=$stmt->rowCount();
if($count>0){
   $data= array(
    "user_approve"=>"1"
   );
   updateData('users',$data,"user_email='$email'");
}
else{
    printFailure("verifycode not Correct");
}
