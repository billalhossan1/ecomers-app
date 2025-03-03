import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key,
    required this.controller,
    required this.onChanged, // Add onChanged parameter
  });

  final TextEditingController controller;
  final Function(String) onChanged; // This will accept the input string

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged, // Set the onChanged callback
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        fillColor: Colors.grey.shade200,
        hintText: 'Search',
        filled: true,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey.shade500),
      ),
    );
  }
}
