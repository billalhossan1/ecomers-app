import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/product/model/product_list_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/product/model/product_model.dart';
import 'package:ecomers_app/features/product/model/review_list_model.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class ReviewListContoller extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<Review> _reviewList = [];
  List<Review> get reviewList => _reviewList;



  Future<bool> getReviewList(String productId) async {
    _inProgress = true;
    bool isSuccess = false;
    update();
    String? token=Get.find<AuthController>().accessToken;
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
        Urls.reviewListUrl(productId),
        accessToken: token
    );

    if (response.isSuccess) {
      _reviewList.clear();
      isSuccess = true;
      ReviewListModel reviewListModel= ReviewListModel.fromJson(
        response.responseData,
      );
      _reviewList.addAll(reviewListModel.data!.results??[]);

    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
