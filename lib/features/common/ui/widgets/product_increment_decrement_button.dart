import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/features/cart/model/cart_model.dart';
import 'package:flutter/material.dart';

class ProductIncrementDecrementButton extends StatefulWidget {
  final CartModel cartModel;
  const ProductIncrementDecrementButton({super.key, required this.cartModel});

  @override
  State<ProductIncrementDecrementButton> createState() =>
      _ProductIncrementDecrementButtonState();
}

class _ProductIncrementDecrementButtonState
    extends State<ProductIncrementDecrementButton> {
  bool isRemoveButtonDisabled = true;
  bool isAddButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        incrementDecrementButton(
          Icons.remove,
          isRemoveButtonDisabled ? null : onTapRemoveButton,
          isRemoveButtonDisabled,
        ),
        const SizedBox(width: 8),
        Text('${widget.cartModel.product!.quantity ?? 1}', style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        incrementDecrementButton(
          Icons.add,
          isAddButtonDisabled ? null : onTapAddButton,
          isAddButtonDisabled,
        ),
      ],
    );
  }

  Container incrementDecrementButton(
      IconData icon, VoidCallback? onTap, bool isButtonDisabled) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isButtonDisabled ? Colors.grey[300] : AppColor.themeColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white, size: 16),
        padding: EdgeInsets.zero,
      ),
    );
  }


  void onTapRemoveButton() {
    final product = widget.cartModel.product;

    if (product?.quantity != null && product!.quantity! > 1) {
      setState(() {
        product.quantity = product.quantity! - 1;
        isAddButtonDisabled = false;
        isRemoveButtonDisabled = product.quantity == 1;
      });
    }
  }

  void onTapAddButton() {
    final product = widget.cartModel.product;

    if (product?.quantity != null && product!.quantity! < 20) {
      setState(() {
        product.quantity = product.quantity! + 1;
        isRemoveButtonDisabled = false;
        isAddButtonDisabled = product.quantity == 20;
      });
    }
  }

}
