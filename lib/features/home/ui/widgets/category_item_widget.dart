import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductListScreen.name,arguments: 'Computer');
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.themeColor.withOpacity(0.2),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.computer,
                size: 50,
                color: AppColor.themeColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Computer',
              style:  TextStyle(
                  color: AppColor.themeColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
  }
}
