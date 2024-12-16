import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  static String name = '/LoginScreen';
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(55.0),
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
              AppThemeData.textFormField('Email', 1),
              const SizedBox(height: 23),
              AppThemeData.nextButton(onPressed:(){} )
            ],
          ),
        ),
      ),
    );
  }
}
