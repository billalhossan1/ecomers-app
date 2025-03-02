import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:ecomers_app/features/product/controller/review_list_contoller.dart';
import 'package:ecomers_app/features/product/ui/screens/create_review_screen.dart';
import 'package:ecomers_app/features/product/ui/widgets/review_widget_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.productId});
  static String name = '/review-screen';
  final String productId;
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  ReviewListContoller reviewListController = Get.find<ReviewListContoller>();
  @override
  void initState() {
    reviewListController.getReviewList(widget.productId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppThemeData.primaryText('Reviews'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: GetBuilder<ReviewListContoller>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CenterCircularProgressIndicator();
                    }else{return Column(
                      children: getReviewList(),
                    );}

                  }
                ),
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColor.themeColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: GetBuilder<ReviewListContoller>(
                builder: (controller) {
                  return  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text('${controller.reviewList.length}'),
                  );
                }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateReviewScreen.name);
        },
        backgroundColor: AppColor.themeColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

List<Widget> getReviewList() {
  ReviewListContoller reviewListController = Get.find<ReviewListContoller>();
  List<Widget> reviewList = [];
  for (int i = 0; i <  reviewListController.reviewList.length; i++) {
    reviewList.add( ReviewWidgetDesign(reviewModel: reviewListController.reviewList[i],));
  }
  return reviewList;
}
