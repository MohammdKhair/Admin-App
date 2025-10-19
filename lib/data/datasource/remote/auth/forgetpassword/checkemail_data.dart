import 'package:admin_app/core/class/crud.dart';
import 'package:admin_app/core/constant/app_links.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLinks.checkemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
