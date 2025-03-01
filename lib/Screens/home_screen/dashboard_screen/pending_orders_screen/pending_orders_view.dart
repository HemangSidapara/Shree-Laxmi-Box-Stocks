import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_assets.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_colors.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_styles.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_utils.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/pending_orders_screen/pending_orders_controller.dart';
import 'package:shree_laxmi_box_stocks/Utils/app_formatter.dart';
import 'package:shree_laxmi_box_stocks/Widgets/animated_staggredlist_widget.dart';
import 'package:shree_laxmi_box_stocks/Widgets/custom_header_widget.dart';
import 'package:shree_laxmi_box_stocks/Widgets/loading_widget.dart';
import 'package:shree_laxmi_box_stocks/Widgets/textfield_widget.dart';

class PendingOrdersView extends GetView<PendingOrdersController> {
  const PendingOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: CustomHeaderWidget(
                title: AppStrings.pendingOrders.tr,
                titleIcon: AppAssets.pendingIcon,
                onBackPressed: () {
                  Get.back(closeOverlays: true);
                },
              ),
            ),
            SizedBox(height: 3.h),

            ///Search Orders
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: TextFieldWidget(
                controller: controller.searchPartyController,
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColors.SECONDARY_COLOR,
                  size: 5.w,
                ),
                prefixIconConstraints: BoxConstraints(maxHeight: 5.h, maxWidth: 8.w, minWidth: 8.w),
                suffixIcon: InkWell(
                  onTap: () async {
                    Utils.unfocus();
                    controller.searchPartyController.clear();
                    await controller.searchPartyName(controller.searchPartyController.text);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: AppColors.SECONDARY_COLOR,
                    size: 5.w,
                  ),
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 5.h, maxWidth: 12.w, minWidth: 12.w),
                hintText: AppStrings.searchParty.tr,
                onChanged: (value) async {
                  await controller.searchPartyName(value);
                },
              ),
            ),
            SizedBox(height: 1.h),

            ///Orders List

            Expanded(
              child: Obx(() {
                if (controller.isGetOrdersLoading.isTrue) {
                  return Center(
                    child: LoadingWidget(
                      height: 5.h,
                    ),
                  );
                } else if (controller.searchedOrdersList.isEmpty) {
                  return Center(
                    child: Text(
                      AppStrings.noDataFound.tr,
                      style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                } else {
                  return AnimationLimiter(
                    child: ListView.separated(
                      itemCount: controller.searchedOrdersList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
                      itemBuilder: (context, index) {
                        final party = controller.searchedOrdersList[index];
                        return AnimatedStaggeredListWidget(
                          index: index,
                          disableDecoratedBox: true,
                          child: Card(
                            color: AppColors.TRANSPARENT,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ExpansionTile(
                              title: SizedBox(
                                height: context.isTablet
                                    ? Device.aspectRatio < 0.5
                                        ? 4.h
                                        : 6.h
                                    : null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Text(
                                            '${index + 1}. ',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.SECONDARY_COLOR,
                                            ),
                                          ),
                                          SizedBox(width: 2.w),
                                          Flexible(
                                            child: Text(
                                              party.partyName ?? '',
                                              style: TextStyle(
                                                color: AppColors.SECONDARY_COLOR,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              tilePadding: EdgeInsets.only(
                                left: 3.w,
                                right: context.isTablet ? 0.5.w : 2.w,
                              ),
                              trailing: context.isTablet
                                  ? const SizedBox()
                                  : IconButton(
                                      onPressed: () async {
                                        Utils.unfocus();
                                      },
                                      style: IconButton.styleFrom(
                                        backgroundColor: AppColors.WARNING_COLOR,
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        padding: EdgeInsets.zero,
                                        elevation: 4,
                                        maximumSize: Size(7.5.w, 7.5.w),
                                        minimumSize: Size(7.5.w, 7.5.w),
                                      ),
                                      icon: Icon(
                                        Icons.edit_rounded,
                                        color: AppColors.PRIMARY_COLOR,
                                        size: 4.w,
                                      ),
                                    ),
                              dense: true,
                              collapsedBackgroundColor: AppColors.LIGHT_SECONDARY_COLOR.withValues(alpha: 0.7),
                              backgroundColor: AppColors.LIGHT_SECONDARY_COLOR.withValues(alpha: 0.7),
                              iconColor: AppColors.SECONDARY_COLOR,
                              collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              children: [
                                Divider(
                                  color: AppColors.HINT_GREY_COLOR,
                                  thickness: 1,
                                  height: 2,
                                ),
                                SizedBox(height: 2.h),

                                ///Products
                                AnimationLimiter(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: AnimationConfiguration.toStaggeredList(
                                      duration: const Duration(milliseconds: 400),
                                      childAnimationBuilder: (child) => SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(child: child),
                                      ),
                                      children: [
                                        for (int i = 0; i < (party.orders?.length ?? 0); i++) ...[
                                          if (i == 0 || party.orders?[i - 1].deliveryDate != party.orders?[i].deliveryDate) ...[
                                            Padding(
                                              padding: EdgeInsets.only(left: 2.w),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ///Delivery Date
                                                  SizedBox(
                                                    width: 70.w,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "✤",
                                                          style: TextStyle(
                                                            color: AppColors.BLACK_COLOR,
                                                            fontSize: 16.sp,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                        SizedBox(width: 2.w),
                                                        Flexible(
                                                          child: Text(
                                                            party.orders?[i].deliveryDate ?? "",
                                                            style: TextStyle(
                                                              color: AppColors.BLACK_COLOR,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 2.h),
                                          ],

                                          ///Order Details
                                          AnimationLimiter(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: AnimationConfiguration.toStaggeredList(
                                                duration: const Duration(milliseconds: 400),
                                                childAnimationBuilder: (child) => SlideAnimation(
                                                  verticalOffset: 50.0,
                                                  child: FadeInAnimation(child: child),
                                                ),
                                                children: [
                                                  (() {
                                                    final orderDetails = party.orders?[i];
                                                    return ExpansionTile(
                                                      title: SizedBox(
                                                        height: context.isTablet
                                                            ? Device.aspectRatio > 0.5
                                                                ? 5.5.h
                                                                : 4.5.h
                                                            : null,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  ///Size
                                                                  Text(
                                                                    "❖",
                                                                    style: TextStyle(
                                                                      fontSize: 16.sp,
                                                                      fontWeight: FontWeight.w600,
                                                                      color: AppColors.SECONDARY_COLOR,
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 2.w),
                                                                  Flexible(
                                                                    child: Text(
                                                                      orderDetails?.boxSize?.getSizeFormatterLB ?? "",
                                                                      style: TextStyle(
                                                                        color: AppColors.BLACK_COLOR,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: 16.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing: context.isTablet
                                                          ? const SizedBox()
                                                          : Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                ///Create Job
                                                                IconButton(
                                                                  onPressed: () async {
                                                                    Utils.unfocus();
                                                                  },
                                                                  style: IconButton.styleFrom(
                                                                    backgroundColor: AppColors.DARK_GREEN_COLOR,
                                                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                    padding: EdgeInsets.zero,
                                                                    elevation: 4,
                                                                    maximumSize: Size(7.5.w, 7.5.w),
                                                                    minimumSize: Size(7.5.w, 7.5.w),
                                                                  ),
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons.arrowsSpin,
                                                                    color: AppColors.PRIMARY_COLOR,
                                                                    size: 4.w,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 2.w),

                                                                ///Delete
                                                                IconButton(
                                                                  onPressed: () async {
                                                                    Utils.unfocus();
                                                                  },
                                                                  style: IconButton.styleFrom(
                                                                    backgroundColor: AppColors.DARK_RED_COLOR,
                                                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                    padding: EdgeInsets.zero,
                                                                    elevation: 4,
                                                                    maximumSize: Size(7.5.w, 7.5.w),
                                                                    minimumSize: Size(7.5.w, 7.5.w),
                                                                  ),
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons.solidTrashCan,
                                                                    color: AppColors.PRIMARY_COLOR,
                                                                    size: 4.w,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                      dense: true,
                                                      collapsedShape: InputBorder.none,
                                                      shape: InputBorder.none,
                                                      collapsedBackgroundColor: AppColors.LIGHT_SECONDARY_COLOR.withValues(alpha: 0.7),
                                                      backgroundColor: AppColors.LIGHT_SECONDARY_COLOR.withValues(alpha: 0.7),
                                                      iconColor: AppColors.SECONDARY_COLOR,
                                                      tilePadding: EdgeInsets.only(left: 4.w, right: 2.w),
                                                      childrenPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 1.h),
                                                      children: [
                                                        Divider(
                                                          color: AppColors.HINT_GREY_COLOR,
                                                          thickness: 1,
                                                          height: 2,
                                                        ),
                                                        SizedBox(height: 0.5.h),
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                                                          child: AnimationLimiter(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              spacing: 0.5.h,
                                                              children: AnimationConfiguration.toStaggeredList(
                                                                duration: const Duration(milliseconds: 175),
                                                                childAnimationBuilder: (child) => ScaleAnimation(
                                                                  child: FadeInAnimation(child: child),
                                                                ),
                                                                children: [
                                                                  ///Order Number
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.orderNumber,
                                                                    value: orderDetails?.purchaseOrderNumber ?? "",
                                                                  ),

                                                                  ///Box Type
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.boxType,
                                                                    value: orderDetails?.boxType ?? "",
                                                                  ),

                                                                  ///Box Quantity
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.boxQuantity,
                                                                    value: orderDetails?.boxQuantity ?? "",
                                                                  ),

                                                                  ///Way Type
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.wayType,
                                                                    value: orderDetails?.wayType ?? "",
                                                                  ),

                                                                  ///Box Purity
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.boxPurityType,
                                                                    value: orderDetails?.boxPurity ?? "",
                                                                  ),

                                                                  Divider(
                                                                    color: AppColors.HINT_GREY_COLOR,
                                                                    thickness: 1,
                                                                    height: 2,
                                                                  ),

                                                                  ///Top Patiya
                                                                  if (orderDetails?.isTop == "Yes") ...[
                                                                    Text(
                                                                      AppStrings.topPatiya.tr,
                                                                      style: AppStyles.size18W700Style?.copyWith(color: AppColors.SECONDARY_COLOR),
                                                                    ),
                                                                    OrderDetailsWidget(
                                                                      title: AppStrings.size,
                                                                      value: orderDetails?.topPatiyaSize?.getSizeFormatterLBH ?? "",
                                                                    ),
                                                                    OrderDetailsWidget(
                                                                      title: AppStrings.quantity,
                                                                      value: orderDetails?.topPatiyaQuantity ?? "",
                                                                    ),
                                                                    Divider(
                                                                      color: AppColors.HINT_GREY_COLOR,
                                                                      thickness: 1,
                                                                      height: 2,
                                                                    ),
                                                                  ],

                                                                  ///Sleeper Patiya
                                                                  Text(
                                                                    AppStrings.sleeperPatiya.tr,
                                                                    style: AppStyles.size18W700Style?.copyWith(color: AppColors.SECONDARY_COLOR),
                                                                  ),
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.size,
                                                                    value: orderDetails?.sleeperPatiyaSize?.getSizeFormatterLBH ?? "",
                                                                  ),
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.quantity,
                                                                    value: orderDetails?.sleeperPatiyaQuantity ?? "",
                                                                  ),
                                                                  Divider(
                                                                    color: AppColors.HINT_GREY_COLOR,
                                                                    thickness: 1,
                                                                    height: 2,
                                                                  ),

                                                                  ///Ghodi Patiya
                                                                  Text(
                                                                    AppStrings.ghodiPatiya.tr,
                                                                    style: AppStyles.size18W700Style?.copyWith(color: AppColors.SECONDARY_COLOR),
                                                                  ),
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.size,
                                                                    value: orderDetails?.ghodiPatiyaSize?.getSizeFormatterLBH ?? "",
                                                                  ),
                                                                  OrderDetailsWidget(
                                                                    title: AppStrings.quantity,
                                                                    value: orderDetails?.ghodiPatiyaQuantity ?? "",
                                                                  ),

                                                                  ///Block
                                                                  if (orderDetails?.wayType == "4 way") ...[
                                                                    Divider(
                                                                      color: AppColors.HINT_GREY_COLOR,
                                                                      thickness: 1,
                                                                      height: 2,
                                                                    ),
                                                                    Text(
                                                                      AppStrings.block.tr,
                                                                      style: AppStyles.size18W700Style?.copyWith(color: AppColors.SECONDARY_COLOR),
                                                                    ),
                                                                    OrderDetailsWidget(
                                                                      title: AppStrings.size,
                                                                      value: orderDetails?.blockSize?.getSizeFormatterLBH ?? "",
                                                                    ),
                                                                    OrderDetailsWidget(
                                                                      title: AppStrings.quantity,
                                                                      value: orderDetails?.blockQuantity ?? "",
                                                                    ),
                                                                  ],
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  })(),
                                                  SizedBox(height: 1.h),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 2.h,
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget OrderDetailsWidget({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Flexible(
          child: Text(
            title.contains(":") ? title.replaceAll(" :", ": ").tr : "${title.tr}: ",
            style: AppStyles.size15W600Style?.copyWith(color: AppColors.SECONDARY_COLOR),
          ),
        ),
        Flexible(
          child: Text(
            value.tr,
            style: AppStyles.size16W600Style?.copyWith(color: AppColors.SECONDARY_COLOR),
          ),
        ),
      ],
    );
  }
}
