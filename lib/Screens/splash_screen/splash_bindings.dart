import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/splash_screen/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
