import 'package:ecomers_app/features/common/ui/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings
{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }

}
