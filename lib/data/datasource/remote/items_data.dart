import 'dart:io';

import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/core/class/status_request.dart';
import 'package:admin_app/core/constant/app_links.dart';
import 'package:dartz/dartz.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  get() async {
    var response = await crud.postData(AppLinks.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLinks.itemsAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, [File? file]) async {
    Either<StatusRequest, Map> response;
    if (file == null) {
      response = await crud.postData(AppLinks.itemsEdit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(AppLinks.itemsEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLinks.itemsDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
