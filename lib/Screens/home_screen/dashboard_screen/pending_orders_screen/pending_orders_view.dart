import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_assets.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/pending_orders_screen/pending_orders_controller.dart';
import 'package:shree_laxmi_box_stocks/Widgets/custom_header_widget.dart';

class PendingOrdersView extends GetView<PendingOrdersController> {
  const PendingOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Header
              CustomHeaderWidget(
                title: AppStrings.pendingOrders.tr,
                titleIcon: AppAssets.pendingIcon,
                onBackPressed: () {
                  Get.back(closeOverlays: true);
                },
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
