import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/category/model/category_list_pagination_model.dart';
import 'package:ecomers_app/features/common/model/product_list_model.dart';
import 'package:ecomers_app/services/network_caller.dart';

import 'package:get/get.dart';

class CategoryListPaginationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page==1&&_inProgress==true;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<ProductModel>  _productList = [];
  List<ProductModel> get productList =>_productList;

  final int _count =21;
  int _page = 0;
  int? _lastPage;

  Future<bool> getProductList() async {
    if(_lastPage!=null && _page>_lastPage!)return false;
    _page++;
    // if(seeAll!=false&&_page>1)return false;
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParam = {
      'count': _count,
      'page': _page,
    };
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.productListUrl,
      queryParam: queryParam,
    );

    if (response.isSuccess) {
      isSuccess = true;
      ProductListModel productListModel= ProductListModel.fromJson(
        response.responseData,
      );
      _productList.addAll(productListModel.data!.results??[]);

      if(productListModel.data!.lastPage!=null){
        _lastPage=productListModel.data!.lastPage;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
  Future<bool> refreshProductList() async {
    _page = 0;
    _lastPage = null;
    _productList.clear();
    return getProductList();
  }
}
