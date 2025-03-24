import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/home/data/model/slider_list_model.dart';
import 'package:ecomers_app/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCaroselSlider extends StatefulWidget {
  const HomeCaroselSlider({
    super.key,
    required this.sliderList,
    required this.onDelete,
  });

  final List<SliderModel> sliderList;
  final Function(String) onDelete;

  @override
  State<HomeCaroselSlider> createState() => _HomeCaroselSliderState();
}

class _HomeCaroselSliderState extends State<HomeCaroselSlider> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    if (widget.sliderList.isEmpty) {
      return const Center(child: Text('No sliders available'));
    }

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            height: 180,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              selectedIndex.value = currentIndex;
            },
          ),
          items: widget.sliderList.asMap().entries.map((entry) {
            int index = entry.key;
            SliderModel banner = entry.value;

            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: AppColor.themeColor,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: banner.photoUrl != null && banner.photoUrl!.isNotEmpty
                          ? NetworkImage(banner.photoUrl!)
                          : const AssetImage('assets/images/placeholder.png')
                      as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          banner.description ?? 'No Description',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 90,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ProductDetailsScreen.name,
                                arguments: {'productId': banner.product},
                              );
                            },
                            child: const Text('Buy now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(Get.find<AuthController>().profileModel!.role==1)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.red.withAlpha(2),
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red, size: 18),
                      onPressed: () => widget.onDelete(widget.sliderList[index].sId!),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.sliderList.length,
                    (i) => Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: value == i ? AppColor.themeColor : Colors.grey.shade300,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }
}
