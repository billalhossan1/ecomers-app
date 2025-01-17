import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/common/ui/widgets/poduct_item_widget.dart';
import 'package:flutter/material.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName});
  final String categoryName;
  static const String name='/product_list_screen';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}


class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppThemeData.primaryText(widget.categoryName),),
      body: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,  mainAxisSpacing: 16),
          itemBuilder: (context, index) {
            return const FittedBox(child: ProductItemWidget(tittle: 'New Year Special 3D', rating: 4.5, price: 100));
          })
    );
  }
}
