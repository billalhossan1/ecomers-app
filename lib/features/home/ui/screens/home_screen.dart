import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/category/contoller/category_list_pagination_controller.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/home/controller/slider_list_controller.dart';
import 'package:ecomers_app/features/home/ui/screens/profile_screen.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_item_widget.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_text_widget.dart';
import 'package:ecomers_app/features/home/ui/widgets/home_carosel_slider.dart';
import 'package:ecomers_app/features/home/ui/widgets/product_search_bar.dart';
import 'package:ecomers_app/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchBarController = TextEditingController();
  final CategoryListPaginationController _categoryListPaginationController = Get.find<CategoryListPaginationController>();


  List<Widget> getSpecialList() {
    List<Widget> productList = [];
    // for (int i = 0; i < 10; i++) {
    //   productList.add(const Padding(
    //     padding: EdgeInsets.all(8.0),
    //     child: ProductItemWidget(
    //       tittle: 'Speccial',
    //       rating: 4.5,
    //       price: 100,
    //     ),
    //   ));
    // }
    return productList;
  }

  List<Widget> getPopularList() {
    List<Widget> popularList = [];
    // for (int i = 0; i < 10; i++) {
    //   popularList.add(const Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: ProductItemWidget(
    //         tittle: 'New Year Special 3D',
    //         rating: 4.5,
    //         price: 100,
    //       )));
    // }
    return popularList;
  }

  List<Widget> getNewList() {
    List<Widget> newList = [];
    // for (int i = 0; i < 10; i++) {
    //   newList.add(const Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: ProductItemWidget(
    //         tittle: 'New Year Special 3D',
    //         rating: 4.5,
    //         price: 100,
    //       ),
    //   ),
    //   );
    // }
    return newList;
  }
  Future<List<Widget>> getCategoryList()async{
    List<Widget> categoryList = [];

    for (int i = 0; i < 11; i++) {
      categoryList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: CategoryItemWidget(categoryModel: _categoryListPaginationController.categoryList[i],)
      ));
    }
    // print('Total categories: ${_categoryListPaginationController.categoryList.length}');
    return categoryList;
  }

  @override
  void dispose() {
    super.dispose();
    searchBarController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(AssetsPath.logoNav),
          actions: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ProfileScreen.name);
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(
                  width: 12,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.call),
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 12,
                ),
                CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.alarm_sharp),
                        color: Colors.white)),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductSearchBar(
                  controller: searchBarController,
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<SliderListController>(
                  builder: (controller) {
                    return Visibility(
                      visible: !controller.inProgress,
                      replacement: const CenterCircularProgressIndicator(),
                      child: HomeCaroselSlider(
                        sliderList: controller.bannerList,
                      ),
                    );
                  }
                ),
                const SizedBox(
                  height: 16,
                ),
              GetBuilder<CategoryListPaginationController>(
                builder: (controller) {
                  return Column(
                    children: [
                      for (int i = 0; i < controller.categoryList.length && i < 10; i++)
                        CategoryTextWidget(
                          onTapSeeAll: () {
                            Get.find<MainBottomNavController>().showCategoryList();
                          },
                          categoryModel: controller.categoryList[i],
                        ),
                    ],
                  );
                },
              ),


              GetBuilder<CategoryListPaginationController>(
              builder: (controller) {
                return Visibility(
                  visible: !controller.initialInProgress,
                  replacement: const CenterCircularProgressIndicator(),
                  child: FutureBuilder<List<Widget>>(
                    future: getCategoryList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CenterCircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return const Center(child: Text("Error loading categories"));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("No categories available"));
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: snapshot.data!),
                      );
                    },
                  ),
                );
              },
            )


            // CategoryTextWidget(
                //   onTapSeeAll: () {
                //     Navigator.pushNamed(context, ProductListScreen.name,
                //         arguments: 'Popular');
                //   },
                //   tittle: 'Popular',
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(children: getPopularList()),
                // ),
                // CategoryTextWidget(
                //   onTapSeeAll: () {
                //     Navigator.pushNamed(context, ProductListScreen.name,
                //         arguments: 'Special');
                //   },
                //   tittle: 'Special',
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(children: getSpecialList()),
                // ),
                // CategoryTextWidget(
                //   onTapSeeAll: () {
                //     Navigator.pushNamed(context, ProductListScreen.name,
                //         arguments: 'New');
                //   },
                //   tittle: 'New',
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(children: getNewList()),
                // ),
              ],
            ),
          ),
        ));

  }


}
