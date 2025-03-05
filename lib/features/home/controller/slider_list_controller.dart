import 'package:ecomers_app/app/urls.dart';
import 'package:ecomers_app/features/home/data/model/slider_list_model.dart';
import 'package:ecomers_app/services/network_caller.dart';
import 'package:get/get.dart';

class SliderListController extends GetxController {
  SliderListModel? _sliderListModel;
  List<SliderModel> get bannerList => _sliderListModel?.data?.results ?? [];
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? errorMessage;
  String? message;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.sliderListUrl);

    if (response.isSuccess) {
      isSuccess=true;
      _sliderListModel = SliderListModel.fromJson(response.responseData);
    }else{
      errorMessage = response.errorMessage;
    }
    _inProgress = false;

    update();
    return isSuccess;
  }
}
