import 'package:admin_app/screens/orders/accepted/view/accepted.dart';
import 'package:admin_app/screens/orders/archive/view/orders_archive.dart';
import 'package:admin_app/screens/orders/pending/view/orders_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int index);
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchive(),
  ];

  List bottomappbar = [
    {
      "title": "Pending",
      "icon": Icons.pending_actions,
      "icon out": Icons.pending_actions_outlined
    },
    {
      "title": "Accepted",
      "icon": Icons.archive,
      "icon out": Icons.archive_outlined
    },
    {
      "title": "Archive",
      "icon": Icons.archive,
      "icon out": Icons.archive_outlined
    },
  ];

  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
