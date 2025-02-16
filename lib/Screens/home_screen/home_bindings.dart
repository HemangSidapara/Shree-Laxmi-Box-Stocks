import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
