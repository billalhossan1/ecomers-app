import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/wish-list/controller/wish_list_controller.dart';
import 'package:ecomers_app/features/wish-list/ui/widgets/wish_list_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static String name = '/wish-list';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController _wishListController = Get.find<WishListController>();

  @override
  void initState() {
    _wishListController.getWishList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: AppThemeData.primaryText('Wish List'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<WishListController>(
          builder: (controller) {
            if (controller.inProgress) {
              return const CenterCircularProgressIndicator();
            } else if (controller.wishList.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your wishlist is empty",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              );
            } else {
              return GridView.builder(
                itemCount: controller.wishList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: WishListProductItemWidget(
                        wishListModel: controller.wishList[index],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
