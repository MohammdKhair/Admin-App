import 'package:admin_app/core/class/handling_data_view.dart';
import 'package:admin_app/screens/orders/archive/controller/orders_archive_controller.dart';
import 'package:admin_app/screens/orders/archive/widget/card_orders_list_archive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveControllerImp());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<OrdersArchiveControllerImp>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardOrdersListArchive(
                  ordersModel: controller.data[index],
                );
              },
            ));
      }),
    );
  }
}
