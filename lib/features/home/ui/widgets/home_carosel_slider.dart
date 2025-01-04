import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomers_app/app/app_color.dart';
import 'package:flutter/material.dart';

class HomeCaroselSlider extends StatelessWidget {
  HomeCaroselSlider({
    super.key,
  });
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            height: 180,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value=currentIndex;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: AppColor.themeColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    )));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value,_) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<5;i++)
                    Container(
                      height: 24,
                      width: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: value == i ? AppColor.themeColor : Colors.grey.shade300,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(24)
                      ),
                    ),
                                ],
              ),

            );
          }
        )
      ],
    );

  }
}
