class AppLinkes{
  static const String server="http://10.200.201.91/ecommerce";

  static const String test="$server/test.php";
  //=====================Auth========================
  static const String signUp="$server/auth/signup.php";
  static const String login="$server/auth/login.php";
  static const String verfycodesignup ='$server/auth/verifycodesignup.php';

//=====================forgetpassword========================
static const String checkemail="$server/forgetpassword/checkemail.php";
static const String verifycodeforgetpassword="$server/forgetpassword/verifycodeforgetpassword.php";
static const String resetpassword="$server/forgetpassword/resetpassword.php";

//=====================home========================
static const String homepage="$server/home.php";

//=====================images========================
 static const String imagesStatic="$server/upload";
 
 static const String imagescategories="$imagesStatic/categories";
 static const String imagesitems="$imagesStatic/items";
}