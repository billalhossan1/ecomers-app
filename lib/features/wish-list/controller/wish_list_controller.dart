import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/common/model/product_list_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<ProductModel>  _wishList = [];
  List<ProductModel> get wishList =>_wishList;



  Future<bool>getWishList()async{
    final String? token = Get.find<AuthController>().accessToken;
    bool isSuccess=false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.wishListUrl,accessToken: token);
    _inProgress= false;
    update();
    if(response.isSuccess){
      _wishList.clear();
      isSuccess=true;
      ProductListModel cartListModel = ProductListModel.fromJson(response.responseData);
      _wishList.addAll(cartListModel.data!.results??[]);
    }else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}