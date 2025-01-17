import 'package:ecomers_app/app/app_color.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget(
      {super.key, required this.colors});
  final List<String> colors;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: getColorItems(),
      ),
    );
  }

  List<Widget> getColorItems() {
    List<Widget> colorList = [];
    for (String color in widget.colors) {
      colorList.add(colorItemDesign(color, (){}));
    }
    return colorList;
  }
  Widget colorItemDesign(String name,VoidCallback onTap)
  {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all()
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(name),
        ),
      ),
    );
  }
}
