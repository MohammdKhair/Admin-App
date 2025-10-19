import 'package:admin_app/core/class/handling_data_view.dart';
import 'package:admin_app/core/constant/app_color.dart';
import 'package:admin_app/core/function/validinput.dart';
import 'package:admin_app/core/shared/custom_button_default.dart';
import 'package:admin_app/core/shared/custom_text_form_global.dart';
import 'package:admin_app/screens/categories/categories_add/controller/categories_add_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Category"),
      ),
      body: GetBuilder<CategoriesAddControllerImp>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextFormGlobal(
                    controller: controller.name,
                    hintText: "category name",
                    labelText: "Category Name",
                    icon: Icons.category,
                    validator: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextFormGlobal(
                    controller: controller.namear,
                    hintText: "category name (Arabic)",
                    labelText: "Category Name (Arabic)",
                    icon: Icons.category,
                    validator: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    keyboardType: TextInputType.text,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.primaryColor,
                      onPressed: () {
                        controller.chooseImage();
                      },
                      child: const Text("Choose Category Image"),
                    ),
                  ),
                  if (controller.file != null)
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: SvgPicture.file(controller.file!)),
                  CustomButtonDefault(
                    text: "Add",
                    onPressed: () {
                      controller.addData();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
