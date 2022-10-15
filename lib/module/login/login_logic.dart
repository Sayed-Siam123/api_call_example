import 'package:api_call_example/provider/api_provider.dart';
import 'package:api_call_example/services/storage_prefs.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../routes/app_pages.dart';
import '/helper/LoaderHelperClass.dart';

class LoginLogic extends GetxController {

  ApiProvider apiProvider = ApiProvider();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  getLogin({username,pass}) async{
    LoaderHelperClass.showLoader();
    dio.Response data = await apiProvider.login(username: username,pass: pass);
    await Future.delayed(const Duration(seconds: 3));
    if(data.statusCode == 200){
      await StoragePrefs().lsWrite(key: StoragePrefs.userToken,value: data.data);


      print("READ FROM STORAGE");
      print(await StoragePrefs().lsRead(key: StoragePrefs.userToken));
      print(await StoragePrefs().lsHasData(key: StoragePrefs.userToken));

      Get.offAllNamed(Routes.DASHBOARD);

    }
    else{
      Get.snackbar("Error", data.data.toString(),snackPosition: SnackPosition.BOTTOM);
    }
    LoaderHelperClass.closeLoader();
  }

}
