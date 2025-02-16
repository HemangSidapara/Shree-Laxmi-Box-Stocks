import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_colors.dart';

Future<void> showBottomSheetWidget({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) async {
  return showModalBottomSheet(
    context: context,
    constraints: BoxConstraints(maxWidth: 100.w, minWidth: 100.w, maxHeight: 90.h, minHeight: 0.h),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    isScrollControlled: true,
    useRootNavigator: true,
    clipBehavior: Clip.hardEdge,
    backgroundColor: AppColors.WHITE_COLOR,
    builder: builder,
  );
}
