import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/product/model/product_list_model.dart';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:ecomers_app/features/wish-list/model/wish_list_model.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final List<WishModel>  _wishList = [];
  List<WishModel> get wishList =>_wishList;



  Future<bool>getWishList()async{
    final String? token = Get.find<AuthController>().accessToken;
    bool isSuccess=false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(Urls.wishListUrl,accessToken: token);


    if(response.isSuccess){
      _wishList.clear();
      isSuccess=true;
      WishListModel wishListModel = WishListModel.fromJson(response.responseData);
      _wishList.addAll(wishListModel.data!.productList??[]);
    }else{
      _wishList.clear();
      _errorMessage = response.errorMessage;
    }
    _inProgress= false;
    update();
    return isSuccess;
  }
}