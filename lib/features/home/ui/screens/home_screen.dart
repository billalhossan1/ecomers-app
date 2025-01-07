
import 'package:ecomers_app/app/assets_path.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_item_widget.dart';
import 'package:ecomers_app/features/home/ui/widgets/category_text_widget.dart';
import 'package:ecomers_app/features/home/ui/widgets/home_carosel_slider.dart';
import 'package:ecomers_app/features/home/ui/widgets/poduct_item_widget.dart';
import 'package:ecomers_app/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
        appBar: AppBar(title: SvgPicture.asset(AssetsPath.logoNav),
          actions: [
            Row(
              children: [
                CircleAvatar(backgroundColor:Colors.grey,child: IconButton(onPressed: (){}, icon: const Icon(Icons.person,color: Colors.white,),)),
                const SizedBox(width: 12,),
                CircleAvatar(backgroundColor: Colors.grey,child: IconButton(onPressed: (){}, icon: const Icon(Icons.call),color: Colors.white),),
                const SizedBox(width: 12,),
                CircleAvatar(backgroundColor: Colors.grey,child: IconButton(onPressed: (){}, icon: const Icon(Icons.alarm_sharp),color: Colors.white)),
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
            HomeCaroselSlider(),
            const SizedBox(
              height: 16,
            ),
            const CategoryTextWidget(
              tittle: 'All Categories',
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: getCategoryList()),
            ),
            const CategoryTextWidget(
              tittle: 'Popular',
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: getPopularList()),
            ), const CategoryTextWidget(
              tittle: 'Special',
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: getSpecialList()),
            ),const CategoryTextWidget(
              tittle: 'New',
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: getNewList()),
            ),
          ],
                ),
              ),
        ));
  }

  List<Widget> getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(const Padding(
        padding: EdgeInsets.all(8.0),
        child: CategoryItemWidget(),
      ));
    }
    return categoryList;
  }

  List<Widget> getSpecialList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductItemWidget(
          tittle: 'Speccial',
          rating: 4.5,
          price: 100,
        ),
      ));
    }
    return categoryList;
  }

  List<Widget> getPopularList() {
    List<Widget> popularList = [];
    for (int i = 0; i < 10; i++) {
      popularList.add(const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProductItemWidget(
            tittle: 'New Year Special 3D',
            rating: 4.5,
            price: 100,
          )));
    }
    return popularList;
  }


  List<Widget> getNewList() {
    List<Widget> newList = [];
    for (int i = 0; i < 10; i++) {
      newList.add(const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProductItemWidget(
            tittle: 'New Year Special 3D',
            rating: 4.5,
            price: 100,
          )));
    }
    return newList;
  }

  @override
  void dispose() {
    super.dispose();
    searchBarController.dispose();
  }
}
