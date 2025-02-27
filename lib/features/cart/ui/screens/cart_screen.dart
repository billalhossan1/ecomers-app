import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/cart/controller/cart_list_controller.dart';
import 'package:ecomers_app/features/cart/ui/widgets/cart_item_widget.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static String name = '/cart-screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartListController cartListController = Get.find<CartListController>();
  @override
  void initState() {
    super.initState();
    cartListController.getCartList();
  }
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
          child: GetBuilder<CartListController>(
            builder: (controller) {
              if(controller.inProgress) {
              return const CenterCircularProgressIndicator();
            } else{
                return Column(

                  children: getCartList(),
                );
              }
            }
          ),
        ),

      ),
    );
  }
  List<Widget>getCartList(){
    List<Widget>cartList=[];
    for(int i=0;i<cartListController.cartList.length;i++){
      cartList.add(CartItemWidget(cartModel: cartListController.cartList[i],));
    }
    return cartList;
  }
}
