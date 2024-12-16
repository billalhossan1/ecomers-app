import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/pin_verification_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/register_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=>const SplashScreen(),
        LoginScreen.name:(context)=>const LoginScreen(),
        PinVerificationScreen.name:(context)=>const PinVerificationScreen(),
        RegisterScreen.name : (context)=>const RegisterScreen(),

      },
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      color: AppColor.themeColor,
      themeMode: ThemeMode.system,

    );
  }
}
