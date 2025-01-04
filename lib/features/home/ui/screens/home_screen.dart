import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomers_app/features/home/ui/widgets/home_carosel_slider.dart';
import 'package:ecomers_app/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ProductSearchBar(
            controller: searchBarController,
          ),
          const SizedBox(height: 16,),
           HomeCaroselSlider(),

        ],
      ),
    ));
  }
}



