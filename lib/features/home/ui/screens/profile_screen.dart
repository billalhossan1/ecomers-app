import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String name = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ElevatedButton(onPressed: (){
        _onPressedLoggedOut(context);
      }, child: const Text("Log Out")),
    );
  }
}

void _onPressedLoggedOut(BuildContext context){
  AuthController authController=Get.find<AuthController>();
  authController.clearUserData();
  Navigator.pushNamed(context, LoginScreen.name);
}