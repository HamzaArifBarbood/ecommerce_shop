<?php
include "../connect.php";
$username=filterRequest("username");
$email=filterRequest("email");
$phone=filterRequest("phone");

$password=sha1($_POST["password"]);
$verifiycode=rand(10000,99999);

$stmt=$con->prepare("SELECT * FROM users WHERE user_email=? OR user_phone=?");
$stmt->execute(array($email,$phone));
$count=$stmt->rowCount();
if($count>0){
    printFailure("The user is existing");
}
else
{
 $data=array(
    'user_name'=>$username,
    'user_email'=>$email,
    'user_phone'=>$phone,
    'user_password'=>$password,
    'user_verfiycode'=>$verifiycode
 );
 insertData('users',$data);
}
?>