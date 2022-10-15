import 'package:api_call_example/routes/app_pages.dart';
import 'package:api_call_example/services/storage_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //builder: EasyLoading.init(),
      enableLog: true,
      initialRoute: StoragePrefs().lsHasData(key: StoragePrefs.userToken) ? AppPages.DASHBOARD : AppPages.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      smartManagement: SmartManagement.keepFactory,
      title: 'Api Example',
      builder: EasyLoading.init(),
    );
  }
}