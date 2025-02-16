import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/pending_orders_screen/pending_orders_controller.dart';

class PendingOrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PendingOrdersController());
  }
}
