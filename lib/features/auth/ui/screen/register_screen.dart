import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/auth/ui/screen/pin_verification_screen.dart';
import 'package:ecomers_app/features/home/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String name = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final TextEditingController _firstNameTEController = TextEditingController();
final TextEditingController _lastNameTEController = TextEditingController();
final TextEditingController _mobileTEController = TextEditingController();
final TextEditingController _cityTEController = TextEditingController();
final TextEditingController _addressTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _RegisterScreenState extends State<RegisterScreen> {
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
                  AppThemeData.textFormField('City', 1, _cityTEController,
                      (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your City Name';
                    } else {
                      return null;
                    }
                  }, TextInputType.text),
                  const SizedBox(height: 12),
                  AppThemeData.textFormField(
                      'Shipping Address', 3, _addressTEController, (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please Enter Your Shipping Address';
                    } else {
                      return null;
                    }
                  }, TextInputType.streetAddress),
                  const SizedBox(height: 23),
                  AppThemeData.nextButton(onPressed: _moveToNextScreen,name: 'Complete')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _moveToNextScreen() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, MainBottomNavBar.name);
    }
  }
}
