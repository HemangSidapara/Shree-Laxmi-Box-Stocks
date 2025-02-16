import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/create_order_screen/create_order_controller.dart';

class CreateOrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CreateOrderController());
  }
}
