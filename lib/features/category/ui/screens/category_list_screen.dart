import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});
  static String name = '/category-list-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppThemeData.primaryText('Category List')),
      body: GridView.builder(itemCount:20,gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 4,mainAxisSpacing: 16), itemBuilder: (context,index){
        return const FittedBox(child: CategoryItemWidget());
      })
    );
  }
}
