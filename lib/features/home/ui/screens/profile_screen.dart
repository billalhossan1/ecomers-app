import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomers_app/features/auth/data/model/user_model.dart';
import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/home/controller/get_profile_controller.dart';
import 'package:ecomers_app/features/home/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String name = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();

  final UserModel? _userModel = Get.find<AuthController>().profileModel;

  @override
  void initState() {
    _loadProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          final userModel = authController.profileModel;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: userModel?.avatarUrl != null &&
                              userModel!.avatarUrl!.isNotEmpty
                          ? ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: userModel.avatarUrl!,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey),
                              ),
                            )
                          : Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle image picker or camera action
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _firstNameTEController,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                  controller: _lastNameTEController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                TextField(
                  controller: _emailNameTEController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _phoneTEController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                TextField(
                  controller: _cityTEController,
                  decoration: InputDecoration(labelText: 'City'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Update"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _onPressedLoggedOut(context);
                  },
                  child: const Text("Log Out"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _loadProfileData() {
    final userModel = Get.find<AuthController>().profileModel;

    if (userModel != null) {
      _firstNameTEController.text = userModel.firstName ?? '';
      _lastNameTEController.text = userModel.lastName ?? '';
      _emailNameTEController.text = userModel.email ?? '';
      _phoneTEController.text = userModel.phone ?? '';
      _cityTEController.text = userModel.city ?? '';
    }
  }

  void _onPressedUpdate(BuildContext context) {
     Get.find<AuthController>().updateProfile(
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      email: _emailNameTEController.text.trim(),
      phone: _phoneTEController.text.trim(),
      city: _cityTEController.text.trim(),
    );
  }
}

void _onPressedLoggedOut(BuildContext context) {
  AuthController authController = Get.find<AuthController>();
  authController.clearUserData();
  Navigator.pushNamed(context, LoginScreen.name);
}
