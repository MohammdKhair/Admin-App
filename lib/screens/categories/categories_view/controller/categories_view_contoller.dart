// ignore_for_file: avoid_print

import 'package:admin_app/core/class/status_request.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/function/handling_data.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/remote/categories_data.dart';
import 'package:admin_app/data/model/categories_model.dart';
import 'package:get/get.dart';

abstract class ItemsViewController extends GetxController {
  getData();
  backToHome(didpop);
  goToEditPage(CategoriesModel categoriesModel);
  deleteCategory(String catid, String imagename);
}

class CategoriesViewControllerImp extends ItemsViewController {
  MyServices myServices = Get.find();
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<CategoriesModel> data = [];

  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("Full Response=========: ${response.toString()}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  backToHome(didpop) {
    if (didpop) {
      return;
    } else {
      Get.offAllNamed(AppRoute.home);
    }
  }

  @override
  deleteCategory(String catid, String imagename) {
    categoriesData.delete({
      "catid": catid,
      "imagename": imagename,
    });
    data.removeWhere((element) => element.categoriesId.toString() == catid);
    update();
  }

  @override
  goToEditPage(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoute.categoriesEdit,
        arguments: {"categoriesModel": categoriesModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
