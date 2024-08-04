<?php
include "../connect.php";
$email=filterRequest("email");
$verifiycode=filterRequest("verifiycode");
$stmt=$con->prepare("SELECT * FROM users WHERE user_email='$email' AND user_verfiycode='$verifiycode'");
$stmt->execute();
$count=$stmt->rowCount();
result($count);
