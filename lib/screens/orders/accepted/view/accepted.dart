import 'package:admin_app/core/class/handling_data_view.dart';
import 'package:admin_app/screens/orders/accepted/widget/card_orders_list_accepted.dart';
import 'package:admin_app/screens/orders/pending/controller/orders_pending_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAccepted extends StatelessWidget {
  const OrdersAccepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: GetBuilder<OrdersPendingControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardOrdersListAccepted(
                  ordersModel: controller.data[index],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
