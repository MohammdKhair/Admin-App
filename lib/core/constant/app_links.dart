class AppLinks {
  static const server = "http://192.168.1.7/ecommerce";

  //======================== Images =============================//
  static const imageCategories = "$server/upload/categories";
  static const imageItems = "$server/upload/items";
  //======================== Auth =============================//
  static const login = "$server/admin/auth/login.php";
  static const resend = "$server/admin/auth/resend.php";
  //======================== ForgetPassword =============================//
  static const checkemail = "$server/admin/forgetpassword/checkemail.php";
  static const verifycode = "$server/admin/forgetpassword/verifycode.php";
  static const resetpassword = "$server/admin/forgetpassword/resetpassword.php";
  //======================== Categories =============================//
  static const categoriesView = "$server/admin/categories/view.php";
  static const categoriesAdd = "$server/admin/categories/add.php";
  static const categoriesEdit = "$server/admin/categories/edit.php";
  static const categoriesDelete = "$server/admin/categories/delete.php";
  //======================== Items =============================//
  static const itemsView = "$server/admin/items/view.php";
  static const itemsAdd = "$server/admin/items/add.php";
  static const itemsEdit = "$server/admin/items/edit.php";
  static const itemsDelete = "$server/admin/items/delete.php";
  //======================== Orders =============================//
  static const ordersApprove = "$server/admin/orders/approve.php";
  static const ordersArchive = "$server/admin/orders/archive.php";
  static const ordersPrepare = "$server/admin/orders/prepare.php";
  static const ordersViewAccepted = "$server/admin/orders/viewaccepted.php";
  static const ordersViewPending = "$server/admin/orders/viewpending.php";
  static const ordersDetails = "$server/admin/orders/details.php";
}
