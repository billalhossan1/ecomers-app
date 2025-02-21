import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/category/model/category_list_pagination_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({
    super.key,
    required this.onTapSeeAll, required this.categoryModel,
  });

  final CategoryModel categoryModel;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppThemeData.primaryText('${categoryModel.title}'),
        TextButton(
          onPressed: onTapSeeAll,
          child: const Text(
            'See All',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
