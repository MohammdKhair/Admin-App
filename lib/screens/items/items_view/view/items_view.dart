import 'package:admin_app/core/class/handling_data_view.dart';
import 'package:admin_app/core/constant/app_color.dart';
import 'package:admin_app/core/constant/app_links.dart';
import 'package:admin_app/core/constant/app_routes.dart';
import 'package:admin_app/screens/items/items_view/controller/items_view_contoller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(AppRoute.itemsAdd);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<ItemsViewControllerImp>(builder: (controller) {
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
                              flex: 1,
                              child: CachedNetworkImage(
                                  height: 80,
                                  imageUrl:
                                      "${AppLinks.imageItems}/${controller.data[index].itemsImage}")),
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
                                              controller.deleteItem(
                                                  controller.data[index].itemsId
                                                      .toString(),
                                                  controller
                                                      .data[index].itemsImage!);
                                              Get.back();
                                            },
                                          );
                                        }),
                                  ],
                                ),
                                subtitle: Text(
                                  controller.data[index].categoriesName!,
                                ),
                                title: Text(
                                  controller.data[index].itemsName!,
                                  style: const TextStyle(fontSize: 18),
                                ),
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
