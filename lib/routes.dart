import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/middleware/mymiddleware.dart';
import 'package:admin_app/screens/auth/forget_password/forgetpassword/view/forgetpassword.dart';
import 'package:admin_app/screens/auth/forget_password/resetpassword/view/resetpassword.dart';
import 'package:admin_app/screens/auth/forget_password/success_resetpassword/view/success_resetpassword.dart';
import 'package:admin_app/screens/auth/forget_password/verifycode/view/verifycode.dart';
import 'package:admin_app/screens/auth/login/view/login.dart';
import 'package:admin_app/screens/categories/categories_add/view/categories_add.dart';
import 'package:admin_app/screens/categories/categories_edit/view/categories_edit.dart';
import 'package:admin_app/screens/categories/categories_view/view/categories_view.dart';
import 'package:admin_app/screens/home/view/home.dart';
import 'package:admin_app/screens/items/items_add/view/items_add.dart';
import 'package:admin_app/screens/items/items_edit/view/items_edit.dart';
import 'package:admin_app/screens/items/items_view/view/items_view.dart';
import 'package:admin_app/screens/orders/order_screen/view/order_screen.dart';
import 'package:admin_app/screens/language/view/language.dart';
import 'package:admin_app/screens/orders/archive/view/orders_archive.dart';
import 'package:admin_app/screens/orders/details/view/orders_details.dart';
import 'package:admin_app/screens/orders/pending/view/orders_pending.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // Language
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [MyMiddleWare()]),
  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  // Home
  GetPage(name: AppRoute.home, page: () => const Home()),
  // Categories
  GetPage(name: AppRoute.categoriesView, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesAdd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesEdit, page: () => const CategoriesEdit()),
  // Categories
  GetPage(name: AppRoute.itemsView, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsAdd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsEdit, page: () => const ItemsEdit()),
  // Orders
  GetPage(name: AppRoute.orderScreen, page: () => const OrderScreen()),
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchive()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
];
