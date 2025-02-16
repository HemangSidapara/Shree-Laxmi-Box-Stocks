import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/settings_screen/settings_controller.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
