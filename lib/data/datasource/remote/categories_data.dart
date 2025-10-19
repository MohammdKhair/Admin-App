import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/core/class/status_request.dart';
import 'package:admin_app/core/constant/app_links.dart';
import 'package:dartz/dartz.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  get() async {
    var response = await crud.postData(AppLinks.categoriesView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLinks.categoriesAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    Either<StatusRequest, Map> response;
    if (file == null) {
      response = await crud.postData(AppLinks.categoriesEdit, data);
    } else {
      response = await crud.addRequestWithImageOne(
          AppLinks.categoriesEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLinks.categoriesDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
