import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/auth/controller/register_controller.dart';
import 'package:ecomers_app/features/auth/ui/screen/pin_verification_screen.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String name = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final TextEditingController _firstNameTEController = TextEditingController();
final TextEditingController _lastNameTEController = TextEditingController();
final TextEditingController _mobileTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();
final TextEditingController _emailAddressTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterController _registerController;

  @override
  void initState() {
    super.initState();
    _registerController = Get.find<RegisterController>();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  SvgPicture.asset(
                    AssetsPath.logo,
                    width: 80,
                    height: 120,
                  ),
                  const SizedBox(height: 18),
                  AppThemeData.primaryText('Complete Profile'),
                  AppThemeData.secondaryText(
                      'Get started with us with your details'),
                  const SizedBox(height: 26),
                  AppThemeData.textFormField(
                      'First Name', 1, _firstNameTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your First Name';
                    } else {
                      return null;
                    }
                  }, TextInputType.text),
                  const SizedBox(height: 12),
                  AppThemeData.textFormField(
                      'Last Name', 1, _lastNameTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Last Name';
                    } else {
                      return null;
                    }
                  }, TextInputType.text),
                  const SizedBox(height: 12),
                  AppThemeData.textFormField(
                    'Mobile',
                    1,
                    _mobileTEController,
                        (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Mobile Number';
                      }
                      if (!RegExp(r'^(?:\+8801|8801|01)[1-9][0-9]{8}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid Bangladeshi mobile number';
                      }
                      return null;
                    },
                    TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  AppThemeData.textFormField(
                      'Password', 1, _passwordTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Password';
                    } else {
                      return null;
                    }
                  }, TextInputType.text),
                  const SizedBox(height: 12),
                  AppThemeData.textFormField(
                      'Email Address', 3, _emailAddressTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Email Address';
                    } else {
                      return null;
                    }
                  }, TextInputType.emailAddress),
                  const SizedBox(height: 23),
                  GetBuilder<RegisterController>(builder: (controller) {
                    if (controller.inProgress) {
                      return const centerCircularProgressIndicator();
                    } else {
                      return AppThemeData.nextButton(
                          onPressed: _moveToCompleteScreen, name: 'Complete');
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    //TODO
    super.dispose();
  }


  Future<void> _moveToCompleteScreen() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _registerController.verifyRegister(
        firstname: _firstNameTEController.text.trim(),
        lastname: _lastNameTEController.text.trim(),
        email: _emailAddressTEController.text.trim(),
        password: _passwordTEController.text.trim(),
        phone: _mobileTEController.text.trim(),
      );
      if (isSuccess) {
        if (mounted) {
          showSnackBarMessage(context, _registerController.message!);
          Navigator.pushNamed(context, PinVerificationScreen.name,
              arguments: _emailAddressTEController.text.trim());
          print('Success');
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _registerController.errorMessage!, true);
          print('Not Success');
        }
      }
    }
  }
}
