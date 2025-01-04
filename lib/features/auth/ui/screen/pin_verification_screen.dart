import 'dart:async';
import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/app_constant.dart';
import 'package:ecomers_app/features/auth/ui/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});
  static String name = '/PinVerificationScreen';

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  late Timer _timer;
   int time=AppConstant.timer;
  bool enableResendButton = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      time--;
      setState(() {});
      if (time == 0) {
        enableResendButton = true;
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
              const SizedBox(height: 24),
              AppThemeData.primaryText('Enter OTP Code'),
              const SizedBox(height: 16),
              AppThemeData.secondaryText('A 4 digit OTP code has been sent'),
              const SizedBox(height: 24),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  inactiveColor: AppColor.themeColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                appContext: context,
              ),
              const SizedBox(height: 16),
              AppThemeData.nextButton(onPressed: _moveToNextScreen),
              const SizedBox(height: 32),
              Visibility(
                visible: !enableResendButton,
                child: RichText(
                  text: TextSpan(
                    text: 'The code will expire in ',
                    style: const TextStyle(color: Colors.black38, fontSize: 16),
                    children: [
                      TextSpan(
                        text: '$time',
                        style: const TextStyle(
                          color: AppColor.themeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(
                        text: 's',
                        style: TextStyle(
                          color: AppColor.themeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: enableResendButton,
                child: TextButton(
                  onPressed: () {
                    enableResendButton=false;
                    time = AppConstant.timer;
                    startTimer();
                    setState(() {});
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _moveToNextScreen() {
    Navigator.pushNamed(context, RegisterScreen.name);
  }
}
