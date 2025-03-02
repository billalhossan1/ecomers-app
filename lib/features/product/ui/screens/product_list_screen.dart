import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/common/ui/widgets/poduct_item_widget.dart';
import 'package:ecomers_app/features/product/controller/product_list_pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName, required this.categoryId, });
  final String categoryName;
  final String categoryId;
  static const String name='/product_list_screen';


  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}


class _ProductListScreenState extends State<ProductListScreen> {
  ProductListPaginationController productListPaginationController =  Get.put(ProductListPaginationController());
  @override
  void initState(){
    super.initState();
   productListPaginationController.getProductList(widget.categoryId);
    print(widget.categoryId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppThemeData.primaryText(widget.categoryName),),
      body: GetBuilder<ProductListPaginationController>(
        builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const CenterCircularProgressIndicator(),
            child: GridView.builder(
                itemCount: controller.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,  mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return  FittedBox(child: ProductItemWidget(productModel: controller.productList[index]));
                }),
          );
        }
      )
    );
  }

}
