import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends GetView<LoginLogic> {


  final TextEditingController userid = TextEditingController();
  final TextEditingController pass = TextEditingController();


  LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.find<LoginLogic>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          SizedBox(height: 15,),


          TextField(
            controller: userid,
            decoration: InputDecoration(
              hintText: "Enter userid",
            ),
          ),

          SizedBox(height: 15,),

          TextField(
            controller: pass,
            decoration: InputDecoration(
              hintText: "Enter password",
            ),
          ),

          SizedBox(height: 15,),

          ElevatedButton(
            onPressed: () async{
              //print(userid.text);
              await controller.getLogin(username: userid.text.toString(),pass: pass.text.toString());
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}
