import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:ecomers_app/features/home/controller/update_profile_controller.dart';
import 'package:ecomers_app/features/home/ui/screens/main_bottom_nav_screen.dart';
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
  final TextEditingController _imageUrlTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn=Get.find<AuthController>().isLoggedIn();
    if (!isLoggedIn) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.deepPurple.shade200, // Stylish app bar color
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              color: Colors.white.withOpacity(0.9),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_outline, size: 80, color: Colors.deepPurple),
                    const SizedBox(height: 20),
                    const Text(
                      "You are not logged in",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        elevation: 5,
                      ),
                      child: const Text("Log In Now", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: GetBuilder<AuthController>(
        builder: (authController) {
          final userModel = authController.profileModel;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                    TextFormField(
                      controller: _firstNameTEController,
                      decoration: const InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameTEController,
                      decoration: const InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      enabled: false,
                      controller: _emailNameTEController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: _phoneTEController,
                      decoration: const InputDecoration(labelText: 'Phone'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityTEController,
                      decoration: const InputDecoration(labelText: 'City'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _imageUrlTEController,
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an image URL';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    GetBuilder<UpdateProfileController>(builder: (controller) {
                      return Visibility(
                        visible: !controller.inProgress,
                        replacement: const CenterCircularProgressIndicator(),
                        child: AppThemeData.nextButton(
                            onPressed: _onPressedUpdate, name: 'Update'),
                      );
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _onPressedLoggedOut(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Log Out"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _loadProfileData() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final userModel = Get.find<AuthController>().profileModel;

    if (userModel != null) {
      setState(() {
        _firstNameTEController.text = userModel.firstName ?? '';
        _lastNameTEController.text = userModel.lastName ?? '';
        _emailNameTEController.text = userModel.email ?? '';
        _phoneTEController.text = userModel.phone ?? '';
        _cityTEController.text = userModel.city ?? '';
        _imageUrlTEController.text = userModel.avatarUrl ?? '';
      });
    }
  }

  void _onPressedUpdate() async {
    if (_formKey.currentState!.validate()) { // Validate the form before updating
      final updateController = Get.find<UpdateProfileController>();
      final authController = Get.find<AuthController>();

      bool success = await updateController.updateProfile(
        _firstNameTEController.text.trim(),
        _lastNameTEController.text.trim(),
        _phoneTEController.text.trim(),
        _cityTEController.text.trim(),
        _imageUrlTEController.text.trim()
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
      } else {
        showSnackBarMessage(context, updateController.errorMessage!, false);
      }
    }
  }

  void _onPressedLoggedOut(BuildContext context) {
    AuthController authController = Get.find<AuthController>();
    authController.clearUserData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainBottomNavBar()),
            (p) => false);
  }
}
