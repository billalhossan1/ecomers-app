import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/auth/data/model/user_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/home/data/model/profile_model.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  // UserModel? userModel;

  Future<bool> updateProfile(String firstName, String lastName, String phone,
      String city,String imageUrl) async {
    bool isSuccess = false;
    _inProgress=true;
    update();
    Map<String,dynamic>body={
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "city": city,
      "avatar_url": imageUrl
    };
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .patchRequest(Urls.profileUrl,accessToken: Get.find<AuthController>().accessToken.toString(),body: body);
    if(response.isSuccess) {
      print("Server Response Data: ${response.responseData}");
      isSuccess=true;
      Map<String, dynamic> userData = response.responseData['data'];
      UserModel usermodel = UserModel.fromJson(userData);
      Get.find<AuthController>().saveUserData(
          Get.find<AuthController>().accessToken.toString(),
          usermodel
      );
      // userModel = usermodel;
    } else {
      // print("Update failed: ${response.errorMessage}");
      _errorMessage = response.errorMessage;
    }


    _inProgress=false;
    update();
    return isSuccess;
  }
}
