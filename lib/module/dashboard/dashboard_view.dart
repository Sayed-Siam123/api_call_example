import 'package:api_call_example/routes/app_pages.dart';
import 'package:api_call_example/services/storage_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_logic.dart';

class DashboardPage extends GetView<DashboardLogic> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DashboardLogic>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await StoragePrefs().lsDelete(key: StoragePrefs.userToken);
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Text("Dashboard"),
          Obx(() {
            return !controller.isLoading.value ? Expanded(
              child: ListView.builder(
                itemCount: controller.viewProductData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(controller.viewProductData[index]["title"]);
                },
              ),
            ) : Center(child: CircularProgressIndicator(),);
          }),
        ],
      ),
    );
  }
}
