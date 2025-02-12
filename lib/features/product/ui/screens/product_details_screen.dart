import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/features/product/ui/screens/review_screen.dart';
import 'package:ecomers_app/features/product/ui/widgets/color_picker_widget.dart';
import 'package:ecomers_app/features/product/ui/widgets/product_carosel_slider.dart';
import 'package:ecomers_app/features/common/ui/widgets/product_increment_decrement_button.dart';
import 'package:ecomers_app/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static String name = '/product/ui/screens/product_details';
  final int productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          ProductCaroselSlider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 230,
                          child: Text(
                            'Happy New Year Special Deal 30%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54),
                          ),
                        ),
                        ProductIncrementDecrementButton()
                      ],
                    ),
                    Row(
                      children: [
                        const Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(fontWeight: FontWeight.w400),
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
                          width: 8,
                        ),
                        const Icon(
                          Icons.favorite,
                          size: 18,
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
                    const SizedBox(
                      height: 8,
                    ),
                    const ColorPickerWidget(
                      colors: ['Red', 'Green', 'Black', 'Yellow', 'Blue'],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Size',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizePickerWidget(sizes: ['S', 'M', 'L', 'XL', 'XXL']),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Take charge of your health with the SmartFit Pro, the ultimate fitness '
                          'companion designed to keep you motivated and informed.'' Equipped with '
                          'advanced sensors,this sleek device tracks your steps, calories burned, '
                          'heart rate, and sleep quality with precision.'
                          'Take charge of your health with the SmartFit Pro, the ultimate fitness '
                          'companion designed to keep you motivated and informed.'' Equipped with '
                          'advanced sensors,this sleek device tracks your steps, calories burned, '
                          'heart rate, and sleep quality with precision.',
                    style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.themeColor.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(children: [
                    Text(
                      'Price',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('\$1000',
                        style:
                            TextStyle(fontSize: 22, color: AppColor.themeColor))
                  ]),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.themeColor,
                    ),
                    onPressed: () {},
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
      ),
    );
  }

  void onPressedReview() {
    Navigator.pushNamed(context, ReviewScreen.name);
  }
}
