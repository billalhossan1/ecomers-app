import 'package:get/get.dart';

class MainBottomNavController extends GetxController{
  int _selectedIndex=0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index)
  {
    if(_selectedIndex==index) {
      return;
    }
    _selectedIndex=index;
    update();
  }
  void showCategoryList()
  {
    changeIndex(1);
  }
  void backToHome()
  {
    changeIndex(0);
  }

}