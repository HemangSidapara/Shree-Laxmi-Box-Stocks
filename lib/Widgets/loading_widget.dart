import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_assets.dart';

class LoadingWidget extends StatelessWidget {
  final double? height;

  const LoadingWidget({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppAssets.splashNoPaddingAnim,
          height: height ?? 3.h,
        ),
      ],
    );
  }
}
