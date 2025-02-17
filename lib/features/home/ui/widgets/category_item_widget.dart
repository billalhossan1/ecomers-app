import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/features/category/model/category_list_pagination_model.dart';
import 'package:ecomers_app/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductListScreen.name,arguments: {
            'categoryName':categoryModel.title,
            'categoryId':categoryModel.sId
          });
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.themeColor.withOpacity(0.2),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.network(categoryModel.icon?? '',width: 60,)
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              categoryModel.title??'',
              style:  const TextStyle(
                  color: AppColor.themeColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
  }
}
