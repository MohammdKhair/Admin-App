import 'package:admin_app/core/class/handling_data_view.dart';
import 'package:admin_app/core/constant/app_color.dart';
import 'package:admin_app/core/constant/app_links.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/screens/categories/categories_view/controller/categories_view_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(AppRoute.categoriesAdd);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<CategoriesViewControllerImp>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              controller.backToHome(didPop);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.goToEditPage(controller.data[index]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: SvgPicture.network(
                                  height: 80,
                                  "${AppLinks.imageCategories}/${controller.data[index].categoriesImage}")),
                          Expanded(
                              flex: 2,
                              child: ListTile(
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () {
                                          Get.defaultDialog(
                                            buttonColor: AppColor.primaryColor,
                                            title: "تحذير",
                                            middleText:
                                                "هل انت متأكد من عملية الحذف",
                                            onCancel: () {},
                                            onConfirm: () {
                                              controller.deleteCategory(
                                                  controller
                                                      .data[index].categoriesId
                                                      .toString(),
                                                  controller.data[index]
                                                      .categoriesImage!);
                                              Get.back();
                                            },
                                          );
                                        }),
                                  ],
                                ),
                                subtitle: Text(
                                    controller.data[index].categoriesDatatime!),
                                title: Text(
                                    controller.data[index].categoriesName!),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
