import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/auth/ui/screen/pin_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static String name = '/LoginScreen';
}

TextEditingController _emailTEController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(55.0),
          child: Form(
            key: _formKey, // Correct placement of the form key
            child: Column(
              children: [
                const SizedBox(height: 120),
                SvgPicture.asset(
                  AssetsPath.logo,
                  width: 80,
                  height: 120,
                ),
                const SizedBox(height: 21),
                AppThemeData.primaryText('Welcome Back'),
                const SizedBox(height: 16),
                AppThemeData.secondaryText('Please Enter Your Email Address'),
                const SizedBox(height: 26),
                AppThemeData.textFormField(
                  'Email',
                  1,
                  _emailTEController,
                      (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },TextInputType.emailAddress
                ),
                const SizedBox(height: 23),
                AppThemeData.nextButton(onPressed: _moveToNextScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _moveToNextScreen() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, PinVerificationScreen.name);
    }
  }
}
