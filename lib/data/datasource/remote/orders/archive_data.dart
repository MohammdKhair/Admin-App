import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/core/constant/app_links.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getAllData() async {
    var response = await crud.postData(AppLinks.ordersArchive, {});
    return response.fold((l) => l, (r) => r);
  }
}
