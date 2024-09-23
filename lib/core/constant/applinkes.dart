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

//=====================favorite========================
static const String addfav="$server/favorite/add.php";
static const String removefav="$server/favorite/remove.php";
static const String itemsfavorite="$server/favorite/itemsfavorite.php";
static const String deletefromfavorites="$server/favorite/deletefromfavorites.php";

//=====================cart========================
static const String addcart="$server/cart/add.php";
static const String deletecart="$server/cart/delete.php";
static const String getitemscart="$server/cart/getitemscart.php";
static const String getcountitmes="$server/cart/getcountitmes.php";

//=====================images========================
 static const String imagesStatic="$server/upload";
 
 static const String imagescategories="$imagesStatic/categories";
 static const String imagesitems="$imagesStatic/items";
}