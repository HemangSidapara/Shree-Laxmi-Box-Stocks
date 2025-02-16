import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_assets.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_colors.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_constance.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Screens/splash_screen/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SECONDARY_COLOR,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Lottie.asset(
                    AppAssets.splashAnim,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  AppStrings.appName.tr,
                  style: TextStyle(
                    color: AppColors.PRIMARY_COLOR,
                    fontWeight: FontWeight.w600,
                    fontSize: 26.sp,
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            return Text(
              AppConstance.appVersion.replaceAll('1.0.0', controller.currentVersion.value),
              style: TextStyle(
                color: AppColors.PRIMARY_COLOR.withValues(alpha: 0.55),
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
              ),
            );
          }),
          Text(
            AppStrings.poweredByMindwaveInfoway,
            style: TextStyle(
              color: AppColors.LIGHT_SECONDARY_COLOR.withValues(alpha: 0.55),
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
