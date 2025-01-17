import 'package:ecomers_app/app/app_color.dart';
import 'package:flutter/material.dart';

class ProductIncrementDecrementButton extends StatefulWidget {
  const ProductIncrementDecrementButton({super.key});

  @override
  State<ProductIncrementDecrementButton> createState() =>
      _ProductIncrementDecrementButtonState();
}

class _ProductIncrementDecrementButtonState
    extends State<ProductIncrementDecrementButton> {
  bool isRemoveButtonDisabled = true;
  bool isAddButtonDisabled = false;
  int quantity = 1;

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
        Text('$quantity', style: const TextStyle(fontSize: 18)),
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
    if (quantity > 1) {
      setState(() {
        quantity--;
        isAddButtonDisabled = false;
        if (quantity == 1) isRemoveButtonDisabled = true;
      });
    }
  }

  void onTapAddButton() {
    if (quantity < 20) {
      setState(() {
        quantity++;
        isRemoveButtonDisabled = false;
        if (quantity == 20) isAddButtonDisabled = true;
      });
    }
  }
}
