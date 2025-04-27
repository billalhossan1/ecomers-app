import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeController extends GetxController {
  final RxBool isDarkMode = false.obs;

  static const String _themeKey = 'isDarkMode';

  @override
  void onInit() {
    super.onInit();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_themeKey)) {
      isDarkMode.value = prefs.getBool(_themeKey)!;
    } else {
      isDarkMode.value = false;
      await _savePreference(_themeKey, false);
    }
  }

  Future<void> toggleTheme() async {
    isDarkMode.toggle();
    await _savePreference(_themeKey, isDarkMode.value);
  }

  Future<void> _savePreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  ThemeMode get currentTheme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  Color get textColor => isDarkMode.value ? Colors.white : Colors.black;
}
