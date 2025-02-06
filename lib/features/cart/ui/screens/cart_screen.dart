import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/cart/ui/widgets/cart_item_widget.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static String name = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: AppThemeData.primaryText('Cart'),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavController>().backToHome();
          }, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: getCartList(),
          ),
        ),

      ),
    );
  }
  List<Widget>getCartList(){
    List<Widget>cartList=[];
    for(int i=0;i<6;i++){
      cartList.add(CartItemWidget());
    }
    return cartList;
  }
}
