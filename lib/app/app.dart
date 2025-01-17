import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/controller_binder.dart';
import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/pin_verification_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/register_screen.dart';
import 'package:ecomers_app/features/auth/ui/screen/splash_screen.dart';
import 'package:ecomers_app/features/category/ui/screens/category_list_screen.dart';
import 'package:ecomers_app/features/home/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecomers_app/features/product/ui/screens/product_details_screen.dart';
import 'package:ecomers_app/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name)
          {
            widget = const SplashScreen();
          }else if(settings.name == LoginScreen.name)
            {
              widget = const LoginScreen();
            }else if(settings.name == PinVerificationScreen.name)
        {
          widget = const PinVerificationScreen();
        }else if(settings.name == RegisterScreen.name)
        {
          widget = const RegisterScreen();
        }else if(settings.name == MainBottomNavBar.name)
        {
          widget = const MainBottomNavBar();
        }else if(settings.name == CategoryListScreen.name)
        {
          widget = const CategoryListScreen();
        }else if(settings.name ==ProductListScreen.name)
        {
          String categoryName = settings.arguments as String;
          widget = ProductListScreen(categoryName: categoryName,);
        }else if(settings.name ==ProductDetailsScreen.name)
        {
          int productId = settings.arguments as int;
          widget = ProductDetailsScreen(productId: productId);
        }
        return MaterialPageRoute(builder: (ctx){
          return widget;
        });
      },
      // routes: {
      //   // '/': (context)=>const SplashScreen(),
      //   LoginScreen.name:(context)=>const LoginScreen(),
      //   PinVerificationScreen.name:(context)=>const PinVerificationScreen(),
      //   RegisterScreen.name : (context)=>const RegisterScreen(),
      //   MainBottomNavBar.name : (context)=>const MainBottomNavBar(),
      //   CategoryListScreen.name : (context)=>const CategoryListScreen(),
      //   ProductListScreen.name:(context)=>const ProductListScreen(categoryName: "categoryName"),
      // },
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      color: AppColor.themeColor,
      themeMode: ThemeMode.system,

    );
  }
}
