import 'package:admin_app/core/constant/app_image.dart';
import 'package:admin_app/screens/home/controller/home_controller.dart';
import 'package:admin_app/screens/home/widget/card_admin_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getValueForScreenType<int>(
                    context: context,
                    mobile: 3,
                    tablet: 4,
                    desktop: 5,
                  ),
                  mainAxisExtent: 150),
              children: [
                CardAdminHome(
                  url: AppImage.categories,
                  title: "Categories",
                  onTap: () {
                    homeControllerImp.goToCategories();
                  },
                ),
                CardAdminHome(
                  url: AppImage.items,
                  title: "Items",
                  onTap: () {
                    homeControllerImp.goToItems();
                  },
                ),
                CardAdminHome(
                  url: AppImage.users,
                  title: "Users",
                  onTap: () {},
                ),
                CardAdminHome(
                  url: AppImage.orders,
                  title: "Orders",
                  onTap: () {
                    homeControllerImp.goToOreders();
                  },
                ),
                CardAdminHome(
                  url: AppImage.report,
                  title: "Report",
                  onTap: () {},
                ),
                CardAdminHome(
                  url: AppImage.notifications,
                  title: "Notificatios",
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
