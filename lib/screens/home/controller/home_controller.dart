import 'package:admin_app/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  goToCategories();
  goToItems();
  goToOreders();
}

class HomeControllerImp extends HomeController {
  @override
  goToCategories() {
    Get.toNamed(AppRoute.categoriesView);
  }

  @override
  goToItems() {
    Get.toNamed(AppRoute.itemsView);
  }

  @override
  goToOreders() {
    Get.toNamed(AppRoute.orderScreen);
  }
}
