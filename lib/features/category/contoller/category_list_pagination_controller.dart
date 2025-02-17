import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/category/model/category_list_pagination_model.dart';
import 'package:ecomers_app/services/network_caller.dart';

import 'package:get/get.dart';

class CategoryListPaginationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  CategoryListPaginationModel? _categoryListPaginationModel;
  List<CategoryModel>? get categoryList =>
      _categoryListPaginationModel?.data?.results;

  final int _count = 20;
  int _page = 1;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParam = {
      'count': _count,
      'page': _page,
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.categoryListUrl,
      queryParam: queryParam,
    );
    _inProgress = false;
    update();
    if (response.isSuccess) {
      isSuccess = true;
      _categoryListPaginationModel = CategoryListPaginationModel.fromJson(
        response.responseData,
      );
    } else {
      _errorMessage = response.errorMessage;
    }

    return isSuccess;
  }
}
