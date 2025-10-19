import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/core/constant/app_links.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getAllData() async {
    var response = await crud.postData(AppLinks.ordersViewPending, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String ordersid, String usersid) async {
    var response = await crud.postData(
        AppLinks.ordersApprove, {"usersid": usersid, "ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
