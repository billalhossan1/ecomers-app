import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';

import 'package:get/get.dart';

class AddToWishController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;



  Future<bool> addToWish(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    String? token=Get.find<AuthController>().accessToken;
    Map<String,dynamic>body={
      "product":productId
    };
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
        Urls.addToWishUrl,
        body: body,
        accessToken: token
    );

    if (response.isSuccess) {
      isSuccess = true;

    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
