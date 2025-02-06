import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class OtpVerifiactionController extends GetxController{
  bool _inProgress=false;
  bool get inProgress => _inProgress;
  String? errorMessage;
  String? message;
  Future<bool>verifyOtp(String email,String otp) async {
    bool isSuccess=false;
    _inProgress=true;
    update();
    Map<String,dynamic>body={
      "email":email,
      "otp":otp
    };
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(Urls.otpVerficationUrl,body: body);
    if(response.isSuccess){
      errorMessage=null;
      message=response.responseData["msg"];
      isSuccess=true;
      return isSuccess;
    }else{
      errorMessage=response.responseData["msg"];
    }
    _inProgress=false;
    update();
    return isSuccess;
  }
}