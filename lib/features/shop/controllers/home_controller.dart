import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;

  void updatePageindicator(index) {
    carousalCurrentIndex.value = index;
  }
}
