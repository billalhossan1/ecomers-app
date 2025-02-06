import 'package:ecomers_app/app/app_color.dart';
import 'package:flutter/material.dart';

class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({super.key, required this.sizes});
  final List<String> sizes;

  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: getSizeItems(),
      ),
    );
  }

  List<Widget> getSizeItems() {
    List<Widget> sizeList = [];
    for (String size in widget.sizes) {
      Widget item = sizeItemDesign(
        name: size,
        onTap: () {
          _selectedSize = size;
          setState(() {});
        },
        isSelected: _selectedSize == size,
      );
      sizeList.add(item);
    }
    return sizeList;
  }

  Widget sizeItemDesign(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColor.themeColor : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(name,style: TextStyle(color: isSelected ? Colors.white : Colors.black54,),),
        ),
      ),
    );
  }
}
