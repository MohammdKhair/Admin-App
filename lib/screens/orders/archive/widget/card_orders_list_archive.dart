import 'package:admin_app/core/constant/app_color.dart';
import 'package:admin_app/data/model/orders_model.dart';
import 'package:admin_app/screens/orders/archive/controller/orders_archive_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveControllerImp> {
  final OrdersModel ordersModel;
  const CardOrdersListArchive({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${ordersModel.ordersId}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(ordersModel.ordersDatetime.toString()).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor, fontSize: 18),
                )
              ],
            ),
            const Divider(),
            Text(
                "Order type : ${controller.printTypeOrder(ordersModel.ordersType.toString())}"),
            Text("Order price : ${ordersModel.ordersPrice} \$"),
            Text("delivery price : ${ordersModel.ordersPricedelivery} \$"),
            Text(
                "Payment method : ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod.toString())}"),
            Text(
                "Order Status : ${controller.printOrderStatus(ordersModel.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Text(
                    "Total Price : ${ordersModel.ordersTotalprice?.toDouble()} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 5),
                MaterialButton(
                  onPressed: () {
                    controller.goToOrdersDetails(ordersModel);
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                  child: const Text("Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
