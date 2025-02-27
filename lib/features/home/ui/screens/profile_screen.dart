import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:ecomers_app/features/home/controller/update_profile_controller.dart';
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

 // final UserModel? _userModel = Get.find<AuthController>().profileModel;

  @override
  void initState() {
    super.initState();
    _loadProfileData();

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
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.person,
                                        size: 50, color: Colors.grey),
                              ),
                            )
                          : const Icon(Icons.person,
                              size: 50, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                TextField(
                  enabled: false,
                  controller: _emailNameTEController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _phoneTEController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextField(
                  controller: _cityTEController,
                  decoration: const InputDecoration(labelText: 'City'),
                ),
                const SizedBox(height: 20),
                GetBuilder<UpdateProfileController>(builder: (controller) {
                  return Visibility(
                    visible: !controller.inProgress,
                    replacement: const CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        _onPressedUpdate();
                      },
                      child: const Text('Update'),
                    ),
                  );
                }),
                const SizedBox(height: 20),
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

  void _loadProfileData() async{
    await Future.delayed(const Duration(milliseconds: 300));
    final userModel = Get.find<AuthController>().profileModel;

    if (userModel != null) {
      setState(() {
        _firstNameTEController.text = userModel.firstName ?? '';
        _lastNameTEController.text = userModel.lastName ?? '';
        _emailNameTEController.text = userModel.email ?? '';
        _phoneTEController.text = userModel.phone ?? '';
        _cityTEController.text = userModel.city ?? '';
      });
    }
  }

  void _onPressedUpdate() async {
    final updateController = Get.find<UpdateProfileController>();
    final authController = Get.find<AuthController>();

    bool success = await updateController.updateProfile(
      _firstNameTEController.text.trim(),
      _lastNameTEController.text.trim(),
      _phoneTEController.text.trim(),
      _cityTEController.text.trim(),
    );

    if (success) {
      if (mounted) {
        Get.snackbar(
          'Success',
          'Profile has been updated',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }

      await authController.getUserData();
      _loadProfileData();
    }else{
      showSnackBarMessage(context, updateController.errorMessage!,false);
    }
  }




  void _onPressedLoggedOut(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    authController.clearUserData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (p) => false);
  }
}
