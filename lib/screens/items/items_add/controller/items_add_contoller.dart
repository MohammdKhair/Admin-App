// ignore_for_file: avoid_print

import 'dart:io';

import 'package:admin_app/core/class/status_request.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/function/handling_data.dart';
import 'package:admin_app/core/function/upload_file.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/remote/categories_data.dart';
import 'package:admin_app/data/datasource/remote/items_data.dart';
import 'package:admin_app/data/model/categories_model.dart';
import 'package:admin_app/screens/items/items_view/controller/items_view_contoller.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsAddController extends GetxController {
  addData();
  chooseImageGallery();
  chooseImageCamera();
  showOptionImage();
  getCategories();
}

class ItemsAddControllerImp extends ItemsAddController {
  MyServices myServices = Get.find();

  ItemsData itemsData = ItemsData(Get.find());

  List<SelectedListItem<String>> dropdownlist = [];

  StatusRequest statusRequest = StatusRequest.none;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController catid;
  late TextEditingController catname;

  File? file;

  @override
  showOptionImage() {
    showBottomMenu(() => chooseImageCamera(), () => chooseImageGallery());
  }

  @override
  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  @override
  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  @override
  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Pleas Choose Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid.text,
        "date": DateTime.now().toString()
      };
      var response = await itemsData.add(data, file!);
      print("Full Response=========: ${response.toString()}");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.itemsView);
          ItemsViewControllerImp c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  getCategories() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("Full Response=========: ${response.toString()}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
        for (var i = 0; i < data.length; i++) {
          dropdownlist.add(SelectedListItem(
              data:
                  "${data[i].categoriesId!.toString()},\r${data[i].categoriesName!}"));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void dispose() {
    name.dispose();
    namear.dispose();
    desc.dispose();
    descar.dispose();
    count.dispose();
    price.dispose();
    discount.dispose();
    catid.dispose();
    catname.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    getCategories();
    super.onInit();
  }
}
