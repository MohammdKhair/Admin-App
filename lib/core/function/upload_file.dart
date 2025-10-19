import 'dart:io';

import 'package:admin_app/core/constant/app_color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "JPG", "jpeg", "gif"]);

  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showBottomMenu(Function() imageUploadCamera, Function() fileUploadGallery) {
  Get.bottomSheet(
      backgroundColor: Colors.white,
      Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "اختيار الصورة",
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    imageUploadCamera();
                    Get.back();
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    size: 40,
                  ),
                  title: const Text(
                    "صورة من الكاميرا",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  onTap: () {
                    fileUploadGallery();
                    Get.back();
                  },
                  leading: const Icon(
                    Icons.image,
                    size: 40,
                  ),
                  title: const Text(
                    "صورة من الاستديو",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          )));
}
