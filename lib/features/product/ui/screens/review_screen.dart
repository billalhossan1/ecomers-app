import 'package:ecomers_app/app/app_color.dart';
import 'package:ecomers_app/app/app_theme_data.dart';
import 'package:ecomers_app/features/product/ui/screens/create_review_screen.dart';
import 'package:ecomers_app/features/product/ui/widgets/review_widget_design.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});
  static String name = '/review-screen';

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
                child: Column(
                  children: getReviewList(),
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
              child: const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Reviews (1000)'),
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
  List<Widget> reviewList = [];
  for (int i = 0; i < 8; i++) {
    reviewList.add(const ReviewWidgetDesign());
  }
  return reviewList;
}
