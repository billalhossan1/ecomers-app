import 'package:ecomers_app/features/auth/controller/login_controller.dart';
import 'package:ecomers_app/features/auth/controller/otp_verification_controller.dart';
import 'package:ecomers_app/features/auth/controller/register_controller.dart';
import 'package:ecomers_app/features/cart/controller/cart_list_controller.dart';
import 'package:ecomers_app/features/cart/controller/delete_cart_controller.dart';
import 'package:ecomers_app/features/category/contoller/category_list_pagination_controller.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/home/controller/get_profile_controller.dart';
import 'package:ecomers_app/features/home/controller/slider_list_controller.dart';
import 'package:ecomers_app/features/home/controller/update_profile_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings
{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(LogInController());
    Get.put(OtpVerifiactionController());
    Get.put(AuthController());
    Get.put(SliderListController());
    Get.put(RegisterController());
    Get.put(CategoryListPaginationController());
    Get.put(UpdateProfileController());
    Get.put(CartListController());
    Get.put(DeleteCartController());
    // Get.put(GetProfileDataController());
    // Get.put(HomeCategoryListController());
  }

}
