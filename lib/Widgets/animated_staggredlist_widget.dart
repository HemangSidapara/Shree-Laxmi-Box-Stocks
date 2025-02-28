import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_colors.dart';

class AnimatedStaggeredListWidget<T> extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  final Widget child;
  final bool disableDecoratedBox;

  const AnimatedStaggeredListWidget({
    super.key,
    required this.index,
    this.onTap,
    required this.child,
    this.disableDecoratedBox = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 400),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: disableDecoratedBox
                ? child
                : DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.WHITE_COLOR,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.GREY_COLOR.withValues(alpha: 0.2),
                          blurRadius: 25,
                          offset: const Offset(-10, 5),
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h).copyWith(left: 4.w),
                      child: child,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
