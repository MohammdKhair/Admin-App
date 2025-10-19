// ignore_for_file: avoid_print

import 'dart:io';

import 'package:admin_app/core/class/status_request.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/core/function/handling_data.dart';
import 'package:admin_app/core/function/upload_file.dart';
import 'package:admin_app/core/services/services.dart';
import 'package:admin_app/data/datasource/remote/items_data.dart';
import 'package:admin_app/data/model/items_model.dart';
import 'package:admin_app/screens/items/items_view/controller/items_view_contoller.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ItemsEditController extends GetxController {
  changeStatusActive(val);
  editData();
  showOptionImage();
  chooseImageGallery();
  chooseImageCamera();
}

class ItemsEditControllerImp extends ItemsEditController {
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
  String? active;
  ItemsModel? itemsModel;

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
  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "itemid": itemsModel!.itemsId.toString(),
        "imageold": itemsModel!.itemsImage,
        "active": active,
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
      var response = await itemsData.edit(data, file);
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
  changeStatusActive(val) {
    active = val;
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
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;
    count.text = itemsModel!.itemsCount.toString();
    price.text = itemsModel!.itemsPrice.toString();
    discount.text = itemsModel!.itemsDiscount.toString();
    catid.text = itemsModel!.categoriesId.toString();
    catname.text = itemsModel!.categoriesName!;
    active = itemsModel!.itemsActive.toString();
    super.onInit();
  }
}
