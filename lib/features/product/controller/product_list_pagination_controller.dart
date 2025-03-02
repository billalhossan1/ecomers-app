import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/product/model/product_list_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';

import 'package:get/get.dart';

class ProductListPaginationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  bool get initialInProgress => _page==1&&_inProgress==true;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<ProductModel>  _productList = [];
  List<ProductModel> get productList =>_productList;

  final int _count =21;
  int _page = 0;
  int? _lastPage;

  Future<bool> getProductList(String catId) async {
    // if(_lastPage!=null && _page>_lastPage!)return false;
    // _page++;
    // if(seeAll!=false&&_page>1)return false;
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParam = {
      'category': catId,
      'count': _count,
    };
    String? token=Get.find<AuthController>().accessToken;
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.productListUrl,
      queryParam: queryParam,
      accessToken: token
    );

    if (response.isSuccess) {
      _productList.clear();
      isSuccess = true;
      ProductListModel productListModel= ProductListModel.fromJson(
        response.responseData,
      );
      _productList.addAll(productListModel.data!.results??[]);

      if(productListModel.data!.lastPage!=null){
        _lastPage=productListModel.data!.lastPage!;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
  Future<bool> refreshProductList(String catID) async {
    _page = 0;
    _lastPage = null;
    _productList.clear();
    return getProductList(catID);
  }
}
