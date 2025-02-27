import 'dart:convert';
import 'package:ecomers_app/features/auth/data/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String _accessTokenKey = 'access-token';
  final String _profileDataKey = 'profileData-key';
  String? accessToken;
  UserModel? profileModel;

  Future<void> saveUserData(String token, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_accessTokenKey, token);
    sharedPreferences.setString(
        _profileDataKey, jsonEncode(userModel.toJson()));
    accessToken = token;
    profileModel = userModel;
  }
  // Future<void>saveUserModel(UserModel userModel) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setString(
  //       _profileDataKey, jsonEncode(userModel.toJson()));
  //   profileModel=userModel;
  // }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    //sharedPreferences.getString(_accessTokenKey);
    String? profileData = sharedPreferences.getString(_profileDataKey);
    if (profileData != null) {
      profileModel = UserModel.fromJson(jsonDecode(profileData));
    }
  }

  bool isLoggedIn() {
    return accessToken != null;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
  }

}


