import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
