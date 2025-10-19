import 'package:admin_app/core/class/handling_data_view.dart';
import 'package:admin_app/core/constant/app_color.dart';
import 'package:admin_app/core/function/validinput.dart';
import 'package:admin_app/core/shared/custom_button_default.dart';
import 'package:admin_app/core/shared/custom_drop_down_search.dart';
import 'package:admin_app/core/shared/custom_text_form_global.dart';
import 'package:admin_app/screens/items/items_add/controller/items_add_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAddControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: GetBuilder<ItemsAddControllerImp>(builder: (controller) {
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
                    hintText: "item name",
                    labelText: "Item Name",
                    icon: Icons.production_quantity_limits,
                    validator: (val) {
                      return validInput(val!, 1, 50, "");
                    },
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextFormGlobal(
                    controller: controller.namear,
                    hintText: "item name (Arabic)",
                    labelText: "Item Name (Arabic)",
                    icon: Icons.production_quantity_limits,
                    validator: (val) {
                      return validInput(val!, 1, 50, "");
                    },
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextFormGlobal(
                    controller: controller.desc,
                    hintText: "descripition",
                    labelText: "Descripition",
                    icon: Icons.production_quantity_limits,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextFormGlobal(
                    controller: controller.descar,
                    hintText: "descripition (Arabic)",
                    labelText: "Descripition (Arabic)",
                    icon: Icons.production_quantity_limits,
                    validator: (val) {
                      return validInput(val!, 1, 200, "");
                    },
                    keyboardType: TextInputType.text,
                  ),
                  CustomTextFormGlobal(
                    controller: controller.count,
                    hintText: "count",
                    labelText: "Count",
                    icon: Icons.production_quantity_limits,
                    validator: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFormGlobal(
                    controller: controller.price,
                    hintText: "price",
                    labelText: "Price",
                    icon: Icons.production_quantity_limits,
                    validator: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFormGlobal(
                    controller: controller.discount,
                    hintText: "discount",
                    labelText: "Discount",
                    icon: Icons.production_quantity_limits,
                    validator: (val) {
                      return validInput(val!, 1, 30, "");
                    },
                    keyboardType: TextInputType.number,
                  ),
                  CustomDropDownSearch(
                    listdata: controller.dropdownlist,
                    dropDownSelectedName: controller.catname,
                    dropDownSelectedId: controller.catid,
                    title: "Choose Category",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.primaryColor,
                      onPressed: () {
                        controller.showOptionImage();
                      },
                      child: const Text("Choose Item Image"),
                    ),
                  ),
                  if (controller.file != null)
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.file(controller.file!)),
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
