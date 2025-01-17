import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/category/ui/screens/category_list_screen.dart';
import 'package:ecomers_app/features/home/ui/screens/cart_screen.dart';
import 'package:ecomers_app/features/home/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});
  static String name = '/MainBottomNavBar';

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
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
