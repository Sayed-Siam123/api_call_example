import 'package:api_call_example/provider/api_provider.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../helper/LoaderHelperClass.dart';


class DashboardLogic extends GetxController {


  var viewProductData = [].obs;
  ApiProvider apiProvider = ApiProvider();
  var isLoading = false.obs;

  @override
  onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getProducts();
  }

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

  getProducts() async{
    isLoading.value = true;
    //LoaderHelperClass.showLoader();
    dio.Response productData = await apiProvider.fetchAllProducts();

    if(productData.statusCode == 200){
      viewProductData.addAll(productData.data);
    }

    else{
      Get.snackbar("Error", "Fetching error",snackPosition: SnackPosition.BOTTOM);
    }
    //LoaderHelperClass.closeLoader();
    isLoading.value = false;
  }
}
