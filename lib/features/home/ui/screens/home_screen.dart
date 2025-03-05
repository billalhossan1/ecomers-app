import 'package:ecomers_app/app/app_constant.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/category/contoller/category_list_pagination_controller.dart';
import 'package:ecomers_app/features/common/controller/main_bottom_nav_controller.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/common/ui/widgets/poduct_item_widget.dart';
import 'package:ecomers_app/features/home/controller/slider_list_controller.dart';
import 'package:ecomers_app/features/home/ui/screens/profile_screen.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_item_widget.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_text_widget.dart';
import 'package:ecomers_app/features/home/ui/widgets/home_carosel_slider.dart';
import 'package:ecomers_app/features/home/ui/widgets/product_search_bar.dart';
import 'package:ecomers_app/features/product/controller/new_product_list_controller.dart';
import 'package:ecomers_app/features/product/controller/popular_product_list_controller.dart';
import 'package:ecomers_app/features/product/controller/product_list_pagination_controller.dart';
import 'package:ecomers_app/features/product/controller/special_product_list_controller.dart';
import 'package:ecomers_app/features/product/ui/screens/product_list_screen.dart';
import 'package:ecomers_app/features/simmer/product_simmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../simmer/simmer.dart' show ProductShimmer;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchBarController = TextEditingController();
  final CategoryListPaginationController _categoryListPaginationController =
      Get.find<CategoryListPaginationController>();
  final ProductListPaginationController _productListPaginationController =
      Get.find<ProductListPaginationController>();

  String searchQuery = '';
  List<Widget> filteredCategories = [];
  List<Widget> filteredProducts = [];

  Future<List<Widget>> getCategoryList() async {
    List<Widget> categoryList = [];
    for (int i = 0;
        i < 11 && _categoryListPaginationController.categoryList.length > i;
        i++) {
      categoryList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: CategoryItemWidget(
            categoryModel: _categoryListPaginationController.categoryList[i]),
      ));
    }
    return categoryList;
  }

  Future<List<Widget>> getProductList() async {
    List<Widget> productList = [];
    for (int i = 0;
        i < 10 && _productListPaginationController.productList.length > i;
        i++) {
      productList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductItemWidget(
            productModel: _productListPaginationController.productList[i]),
      ));
    }
    return productList;
  }

  void filterSearchResults(String query) {
    setState(() {
      searchQuery = query;
      filteredCategories = _categoryListPaginationController.categoryList
          .where((category) =>
              category.title!.toLowerCase().contains(query.toLowerCase()))
          .map((category) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryItemWidget(categoryModel: category),
              ))
          .toList();
      filteredProducts = _productListPaginationController.productList
          .where((product) =>
              product.title!.toLowerCase().contains(query.toLowerCase()))
          .map((product) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductItemWidget(productModel: product),
              ))
          .toList();
    });
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
                  icon: const Icon(Icons.person, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call),
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.alarm_sharp),
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSearchBar(
                controller: searchBarController,
                onChanged: filterSearchResults,
              ),
              const SizedBox(height: 16),
              GetBuilder<SliderListController>(builder: (controller) {
                return Visibility(
                  visible: !controller.inProgress,
                  replacement: const ProductShimmer(itemCount: 3,),
                  child: HomeCaroselSlider(
                    sliderList: controller.bannerList,
                  ),
                );
              }),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppThemeData.primaryText('All Category'),
                  TextButton(
                    onPressed: () {
                      Get.find<MainBottomNavController>().showCategoryList();
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              GetBuilder<CategoryListPaginationController>(
                  builder: (controller) {
                return Visibility(
                  visible: !controller.initialInProgress,
                  replacement: const ProductShimmer(itemCount: 3,),
                  child: FutureBuilder<List<Widget>>(
                    future: getCategoryList(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const ProductShimmer(itemCount: 3,);
                      }
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text("Error loading categories"));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text("No categories available"));
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: searchQuery.isEmpty
                              ? snapshot.data!
                              : filteredCategories.isEmpty
                                  ? [
                                      const Center(
                                          child: Text("No categories found"))
                                    ]
                                  : filteredCategories,
                        ),
                      );
                    },
                  ),
                );
              }),
              const SizedBox(height: 16),
              Column(
                children: [
                  CategoryTextWidget(
                      onTapSeeAll: () {
                        Navigator.pushNamed(
                          context,
                          ProductListScreen.name,
                          arguments: {
                            'categoryName': 'Special',
                            'categoryId': AppConstant.specialCatId,
                          },
                        );
                      },
                      categoryTittle: 'Special'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GetBuilder<SpecialProductListController>(
                        builder: (controller) {
                      if (controller.inProgress) {
                        return const ProductShimmer(itemCount: 3,);
                      } else {
                        if (controller.productList.isEmpty) {
                          return const Center(child: Text('No Product Available'));
                        } else {
                          return Row(
                            children: [
                              for (int i = 0;
                                  i < controller.productList.length && i < 6;
                                  i++)
                                ProductItemWidget(
                                    productModel: controller.productList[i])
                            ],
                          );
                        }
                      }
                    }),
                  ),
                  const SizedBox(height: 16),
                  CategoryTextWidget(
                      onTapSeeAll: () {
                        Navigator.pushNamed(
                          context,
                          ProductListScreen.name,
                          arguments: {
                            'categoryName': 'Popular',
                            'categoryId': AppConstant.popularCatId,
                          },
                        );
                      },
                      categoryTittle: 'Popular'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GetBuilder<PopularProductListController>(
                        builder: (controller) {
                      if (controller.inProgress) {
                        return const ProductShimmer(itemCount: 3,);
                      } else {
                        if (controller.productList.isEmpty) {
                          return const Center(child: Text('No Product Available'));
                        } else {
                          return Row(
                            children: [
                              for (int i = 0;
                                  i < controller.productList.length && i < 6;
                                  i++)
                                ProductItemWidget(
                                    productModel: controller.productList[i])
                            ],
                          );
                        }
                      }
                    }),
                  ),const SizedBox(height: 16),
                  CategoryTextWidget(
                      onTapSeeAll: () {
                        Navigator.pushNamed(
                          context,
                          ProductListScreen.name,
                          arguments: {
                            'categoryName': 'New',
                            'categoryId': AppConstant.newCatId,
                          },
                        );
                      },
                      categoryTittle: 'New'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: GetBuilder<NewProductListController>(
                        builder: (controller) {
                      if (controller.inProgress) {
                        return const ProductShimmer(itemCount: 2,);
                      } else {
                        if (controller.productList.isEmpty) {
                          return const Center(child: Text('No Product Available'));
                        } else {
                          return Row(
                            children: [
                              for (int i = 0;
                                  i < controller.productList.length && i < 6;
                                  i++)
                                ProductItemWidget(
                                    productModel: controller.productList[i])
                            ],
                          );
                        }
                      }
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
