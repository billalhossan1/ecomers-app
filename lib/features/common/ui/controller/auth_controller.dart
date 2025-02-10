import 'dart:convert';
import 'package:ecomers_app/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  final String _accessTokenKey = 'access-token';
  final String _profileDataKey = 'access-token';
  String? accessToken;
  UserModel? profileModel;

  Future<void> saveUserData(String token,UserModel userModel)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_accessTokenKey, accessToken!);
    sharedPreferences.setString(_profileDataKey , jsonEncode(userModel.toJson()));
    profileModel=userModel;
  }
  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString(_accessTokenKey);
    profileModel = UserModel.fromJson(jsonDecode(sharedPreferences.getString(_profileDataKey)!));
  }
}