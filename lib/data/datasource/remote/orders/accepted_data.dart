import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/core/constant/app_links.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData() async {
    var response = await crud.postData(AppLinks.ordersViewAccepted, {});
    return response.fold((l) => l, (r) => r);
  }

  prepare(String usersid, String ordersid, String ordertype) async {
    var response = await crud.postData(AppLinks.ordersPrepare,
        {"usersid": usersid, "ordersid": ordersid, "ordertype": ordertype});
    return response.fold((l) => l, (r) => r);
  }
}
