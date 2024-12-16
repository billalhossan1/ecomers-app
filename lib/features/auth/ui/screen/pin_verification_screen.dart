import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
              const SizedBox(height: 28),
              AppThemeData.primaryText('Enter OTP Code'),
              const SizedBox(height: 16),
              AppThemeData.secondaryText('A 4 digit OTP code has been sent'),
              const SizedBox(height: 26),

              const SizedBox(height: 23),
              AppThemeData.nextButton(onPressed:(){} )
            ],
          ),
        ),
      ),
    );
  }
}
