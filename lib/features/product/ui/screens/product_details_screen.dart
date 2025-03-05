import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/features/auth/ui/screen/login_screen.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:ecomers_app/features/product/controller/add_to_cart_controller.dart';
import 'package:ecomers_app/features/product/controller/add_to_wish_controller.dart';
import 'package:ecomers_app/features/product/controller/product_details_controller.dart';
import 'package:ecomers_app/features/product/ui/screens/review_screen.dart';
import 'package:ecomers_app/features/product/ui/widgets/color_picker_widget.dart';
import 'package:ecomers_app/features/product/ui/widgets/product_carosel_slider.dart';
import 'package:ecomers_app/features/product/ui/widgets/size_picker_widget.dart';
import 'package:ecomers_app/features/simmer/product_simmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId, required this.inWishList});
  static String name = '/product/ui/screens/product_details';
  final String productId;
  final bool inWishList;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsController productDetailsController = Get.find<ProductDetailsController>();

  String? selectedColor;
  String? selectedSize;

  @override
  void initState() {
    super.initState();
    productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        if (controller.isError) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red, size: 50),
                SizedBox(height: 10),
                Text(
                  'Product not found. Please try again.',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
          );
        }
        if (controller.productDetailsModel == null || controller.productDetailsModel!.data == null) {
          return const ProductDetailsShimmer();
        }
        return Column(
          children: [
            ProductCaroselSlider(productDetailsModel: controller.productDetailsModel!),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            child: Text(
                              controller.productDetailsModel?.data?.title ?? 'No Title Available',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                '${controller.productDetailsModel?.data?.iV ?? 0}',
                                style: const TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          TextButton(
                              onPressed: onPressedReview,
                              child: const Text(
                                'Reviews',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.themeColor),
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          IconButton(
                            onPressed: onTapWish,
                            icon: Icon(
                              widget.inWishList ?? false
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.inWishList ?? false
                                  ? Colors.red
                                  : null,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'Color',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      (controller.productDetailsModel?.data!.colors?.isEmpty ?? true)
                          ? const Text("No Color Available")
                          : ColorPickerWidget(
                        colors: controller.productDetailsModel!.data!.colors!,
                        onColorSelected: (color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Size',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      (controller.productDetailsModel?.data!.sizes?.isEmpty ?? true)
                          ? const Text("No Size Available")
                          : SizePickerWidget(
                        sizes: controller.productDetailsModel!.data!.sizes!,
                        onSizeSelected: (size) {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                          controller.productDetailsModel?.data!.description ?? 'No Description Available',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.themeColor.withValues(alpha: 0.2),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      const Text(
                        'Price',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${controller.productDetailsModel?.data!.currentPrice ?? '0'}',
                        style: const TextStyle(fontSize: 22, color: AppColor.themeColor),
                      ),
                    ]),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.themeColor,
                      ),
                      onPressed: onTapAddToCart,
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  void onTapWish() async {
    if (Get.find<AuthController>().isLoggedIn()) {
      AddToWishController addToWishController = Get.find<AddToWishController>();
      final bool result = await addToWishController.addToWish(widget.productId);
      if (result) {
        showSnackBarMessage(context, 'Wish Added Successfully');
      } else {
        showSnackBarMessage(context, addToWishController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }

  void onTapAddToCart() async {
    if (Get.find<AuthController>().isLoggedIn()) {
      if (selectedColor == null || selectedSize == null) {
        showSnackBarMessage(context, 'Please select both color and size');
        return;
      }

      AddToCartController addToCartController = Get.find<AddToCartController>();
      final bool result = await addToCartController.addToCart(
        widget.productId,
        size: selectedSize!,
        color: selectedColor!,
      );
      if (result) {
        showSnackBarMessage(context, 'Cart Added Successfully');
      } else {
        showSnackBarMessage(context, addToCartController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }


  void onPressedReview() {
    Navigator.pushNamed(context, ReviewScreen.name, arguments: {'productId': widget.productId});
  }
}
