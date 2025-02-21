//
// import 'package:ecomers_app/app/urls.dart';
// import 'package:ecomers_app/features/home/data/model/profile_model.dart';
// import 'package:ecomers_app/services/network_caller.dart';
// import 'package:get/get.dart';
//
// class GetProfileDataController extends GetxController {
//   ProfileModel? _profileModel;
//   ProfileModel? get profileModel=>_profileModel;
//   bool _inProgress = false;
//   bool get inProgress => _inProgress;
//
//   String? errorMessage;
//   String? message;
//
//   Future<bool> getProfileData() async {
//     bool isSuccess = false;
//     _inProgress = true;
//     final NetworkResponse response =
//     await Get.find<NetworkCaller>().getRequest(Urls.profileUrl);
//     _inProgress = false;
//     if (response.isSuccess) {
//       isSuccess=true;
//       _profileModel = ProfileModel.fromJson(response.responseData);
//     }else{
//       errorMessage = response.errorMessage;
//     }
//     update();
//     return isSuccess;
//   }
// }
