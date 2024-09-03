class AppLinkes{
  //أي بي الاتصال بمودم ياسر
  static const String server="http://10.200.201.91/ecommerce";
  //آي بي الاتصال بشبكة الجوال المحلية
  // static const String server="http://192.168.43.245/ecommerce";

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

//=====================items========================
static const String items="$server/items/items.php";

//=====================images========================
 static const String imagesStatic="$server/upload";
 
 static const String imagescategories="$imagesStatic/categories";
 static const String imagesitems="$imagesStatic/items";
}