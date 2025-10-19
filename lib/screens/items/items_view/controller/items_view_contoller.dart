// ignore_for_file: avoid_print

import 'package:admin_app/core/class/status_request.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/function/handling_data.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/remote/items_data.dart';
import 'package:admin_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsViewController extends GetxController {
  getData();
  backToHome(didpop);
  goToEditPage(ItemsModel itemsModel);
  deleteItem(String itemid, String imagename);
}

class ItemsViewControllerImp extends ItemsViewController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> data = [];

  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();
    print("Full Response=========: ${response.toString()}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
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
  deleteItem(String itemid, String imagename) {
    itemsData.delete({
      "itemid": itemid,
      "imagename": imagename,
    });
    data.removeWhere((element) => element.itemsId.toString() == itemid);
    update();
  }

  @override
  goToEditPage(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.itemsEdit, arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
