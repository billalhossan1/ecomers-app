import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:flutter/material.dart';

class CategoryTextWidget extends StatelessWidget {

  const CategoryTextWidget({
    super.key, required this.tittle,
  });
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppThemeData.primaryText(tittle),
        TextButton(
            onPressed: () {},
            child: const Text('See All',
                style: TextStyle(
                  fontSize: 18,
                )))
      ],
    );
  }
}