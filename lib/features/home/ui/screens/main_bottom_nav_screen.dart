import 'package:ecomers_app/features/cart/controller/cart_list_controller.dart';
import 'package:ecomers_app/features/cart/ui/screens/cart_screen.dart';
import 'package:ecomers_app/features/category/contoller/category_list_pagination_controller.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/category/ui/screens/category_list_screen.dart';
import 'package:ecomers_app/features/home/controller/get_profile_controller.dart';
import 'package:ecomers_app/features/home/controller/slider_list_controller.dart';
import 'package:ecomers_app/features/wish-list/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});
  static String name = '/MainBottomNavBar';

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  void initState() {
    Get.find<CategoryListPaginationController>().getCategoryList();
    //Get.find<GetProfileDataController>().getProfileData();
    Get.find<SliderListController>().getSliders();

    super.initState();
  }
final List<Widget> screens=[
  const HomeScreen(),
  const CategoryListScreen(),
  const CartScreen(),
  const WishListScreen()
];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(

          bottomNavigationBar: NavigationBar(
              destinations: const[
            NavigationDestination(icon: Icon(Icons.home,), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'WishList'),
          ],
          selectedIndex: controller.selectedIndex,
          onDestinationSelected: controller.changeIndex,

          ),
          body: screens[controller.selectedIndex],
        );
      }
    );
  }
}
