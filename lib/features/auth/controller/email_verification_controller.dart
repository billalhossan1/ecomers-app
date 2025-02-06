import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
   bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? errorMessage;
  String? message;

  Future<bool> verifyEmailPassword(String email,String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String,dynamic>body={
      "email":email,
      "password":password

    };
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.loginUrl,body: body);
    _inProgress = false;
    update();
    if (response.isSuccess) {
      errorMessage = null;
      message = response.responseData["msg"] ?? "Login successful!";
      isSuccess = true;
    } else {
      errorMessage = response.responseData["msg"] ?? "Login failed. Please try again.";
    }

     return isSuccess;

  }
}
