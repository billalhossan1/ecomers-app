import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({
    super.key,
    required this.tittle,
    required this.onTapSeeAll,
  });

  final String tittle;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppThemeData.primaryText(tittle),
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
