import 'dart:convert';

import 'package:api_call_example/services/storage_prefs.dart';
import 'package:dio/dio.dart';

class ApiProvider{

  static Dio api = Dio(BaseOptions(
    baseUrl: "https://fakestoreapi.com/",
    connectTimeout: 50000,
    receiveTimeout: 50000,
    // headers: {
    //   "X-Authorization" : "1y8eGr8r75OOp2D4aMtbsDe6RJbONQL6iIOdH67COieqflQUBu52xTMFgBa6VJdE"
    // }
  ));


  login({username,pass}) async{
    try {
      var response = await api.post("auth/login",data:
      jsonEncode({
          "username": username.toString(),
          "password" : pass.toString()
        }
      ));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }


  fetchAllProducts() async{
    try {
      var response = await api.get("products"
          // options: Options(
          //   headers: {
          //     "Authorization" : await StoragePrefs().lsRead(key: StoragePrefs.userToken)["token"],
          //   })
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}