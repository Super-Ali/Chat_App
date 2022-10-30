import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();
  GetStorage themeStorage = GetStorage('theme');
  Rx<Color> themeColor = (Colors.black).obs;

  Color getTheme() {
    if (themeStorage.read('theme') == 0) {
      return const Color.fromARGB(255, 100, 102, 238);
    } else if (themeStorage.read('theme') == 1) {
      return const Color.fromARGB(255, 100, 238, 111);
    } else if (themeStorage.read('theme') == 2) {
      return const Color.fromARGB(255, 238, 100, 231);
    } else if (themeStorage.read('theme') == 3) {
      return const Color.fromARGB(255, 224, 42, 42);
    } else if (themeStorage.read('theme') == 4) {
      return const Color.fromARGB(255, 42, 224, 224);
    } else if (themeStorage.read('theme') == 5) {
      return const Color.fromARGB(255, 0, 0, 0);
    } else {
      return const Color(0xFFee7b64);
    }
  }

  changeTheme() {
    if (themeColor.value == const Color(0xFFee7b64)) {
      themeColor.value = const Color.fromARGB(255, 100, 102, 238);
      themeStorage.write('theme', 0);
    } else if (themeColor.value == const Color.fromARGB(255, 100, 102, 238)) {
      themeColor.value = const Color.fromARGB(255, 100, 238, 111);
      themeStorage.write('theme', 1);
    } else if (themeColor.value == const Color.fromARGB(255, 100, 238, 111)) {
      themeColor.value = const Color.fromARGB(255, 238, 100, 231);
      themeStorage.write('theme', 2);
    } else if (themeColor.value == const Color.fromARGB(255, 238, 100, 231)) {
      themeColor.value = const Color.fromARGB(255, 224, 42, 42);
      themeStorage.write('theme', 3);
    } else if (themeColor.value == const Color.fromARGB(255, 224, 42, 42)) {
      themeColor.value = const Color.fromARGB(255, 42, 224, 224);
      themeStorage.write('theme', 4);
    } else if (themeColor.value == const Color.fromARGB(255, 42, 224, 224)) {
      themeColor.value = const Color.fromARGB(255, 0, 0, 0);
      themeStorage.write('theme', 5);
    } else {
      themeColor.value = const Color(0xFFee7b64);
      themeStorage.write('theme', null);
    }
    print(themeStorage.read('theme'));
  }
}
