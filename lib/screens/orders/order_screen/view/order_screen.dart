import 'package:admin_app/screens/orders/order_screen/controller/order_screen_controller.dart';
import 'package:admin_app/screens/orders/order_screen/widget/custom_buttomappbar_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          bottomNavigationBar: const CustomButtomAppBarHome(),
          body: controller.listPage.elementAt(controller.currentpage),
        );
      },
    );
  }
}
