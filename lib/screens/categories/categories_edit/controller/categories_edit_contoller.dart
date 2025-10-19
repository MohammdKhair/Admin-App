// ignore_for_file: avoid_print

import 'dart:io';

import 'package:admin_app/core/class/status_request.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/function/handling_data.dart';
import 'package:admin_app/core/function/upload_file.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/remote/categories_data.dart';
import 'package:admin_app/data/model/categories_model.dart';
import 'package:admin_app/screens/categories/categories_view/controller/categories_view_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CategoriesEditController extends GetxController {
  editData();
  chooseImage();
}

class CategoriesEditControllerImp extends CategoriesEditController {
  MyServices myServices = Get.find();
  CategoriesData categoriesData = CategoriesData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CategoriesModel? categoriesModel;
  late TextEditingController name;
  late TextEditingController namear;
  File? file;

  @override
  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  @override
  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "catid": categoriesModel!.categoriesId!.toString(),
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel!.categoriesImage!
      };
      var response = await categoriesData.edit(data, file);
      print("Full Response=========: ${response.toString()}");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.categoriesView);
          CategoriesViewControllerImp c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void dispose() {
    name.dispose();
    namear.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    namear.text = categoriesModel!.categoriesNameAr!;
    super.onInit();
  }
}
