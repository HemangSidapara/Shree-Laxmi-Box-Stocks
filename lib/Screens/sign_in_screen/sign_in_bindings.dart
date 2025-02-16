import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/sign_in_screen/sign_in_controller.dart';

class SignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
