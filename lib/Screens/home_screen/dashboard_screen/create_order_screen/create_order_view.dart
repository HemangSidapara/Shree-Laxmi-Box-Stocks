import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_assets.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_colors.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_styles.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_utils.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/create_order_screen/create_order_controller.dart';
import 'package:shree_laxmi_box_stocks/Widgets/button_widget.dart';
import 'package:shree_laxmi_box_stocks/Widgets/custom_header_widget.dart';
import 'package:shree_laxmi_box_stocks/Widgets/show_bottom_sheet_widget.dart';
import 'package:shree_laxmi_box_stocks/Widgets/textfield_widget.dart';

class CreateOrderView extends GetView<CreateOrderController> {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Header
                CustomHeaderWidget(
                  title: AppStrings.createOrder.tr,
                  titleIcon: AppAssets.createOrderImage,
                  onBackPressed: () {
                    Get.back(closeOverlays: true);
                  },
                ),
                SizedBox(height: 2.h),

                ///Fields
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.createOrderFormKey,
                      child: Column(
                        children: [
                          ///Party Name
                          TextFieldWidget(
                            controller: controller.partyNameController,
                            title: AppStrings.partyName.tr,
                            hintText: AppStrings.selectPartyName.tr,
                            validator: controller.validatePartyList,
                            textInputAction: TextInputAction.next,
                            maxLength: 50,
                            readOnly: true,
                            onTap: () {
                              showBottomSheetPartyName();
                            },
                          ),
                          SizedBox(height: 2.h),

                          ///Party Phone
                          TextFieldWidget(
                            controller: controller.partyPhoneController,
                            title: AppStrings.partyPhone.tr,
                            hintText: AppStrings.enterPartyPhone.tr,
                            validator: controller.validatePartyPhone,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                          ),
                          SizedBox(height: 2.h),

                          ///Party Email
                          TextFieldWidget(
                            controller: controller.partyEmailController,
                            title: AppStrings.partyEmail.tr,
                            hintText: AppStrings.enterPartyEmail.tr,
                            validator: controller.validatePartyEmail,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            maxLength: 30,
                          ),
                          SizedBox(height: 2.h),

                          ///Purchase Order Number
                          TextFieldWidget(
                            controller: controller.purchaseOrderNumberController,
                            title: AppStrings.purchaseOrderNumber.tr,
                            hintText: AppStrings.enterPurchaseOrderNumber.tr,
                            validator: controller.validatePurchaseOrderNumber,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            maxLength: 50,
                          ),
                          SizedBox(height: 2.h),

                          ///Box Type
                          Padding(
                            padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.boxType.tr,
                                style: AppStyles.size16W600Style,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ///Pellet
                              Obx(() {
                                return TypeWidget(
                                  index: 0,
                                  selectedIndex: controller.selectedBoxType.value,
                                  title: controller.boxTypeList[0].tr,
                                  selectedType: controller.selectedBoxType,
                                );
                              }),
                              SizedBox(width: 2.w),

                              ///Box
                              Obx(() {
                                return TypeWidget(
                                  index: 1,
                                  selectedIndex: controller.selectedBoxType.value,
                                  title: controller.boxTypeList[1].tr,
                                  selectedType: controller.selectedBoxType,
                                );
                              }),
                              SizedBox(width: 2.w),

                              ///Cage
                              Obx(() {
                                return TypeWidget(
                                  index: 2,
                                  selectedIndex: controller.selectedBoxType.value,
                                  title: controller.boxTypeList[2].tr,
                                  selectedType: controller.selectedBoxType,
                                );
                              }),
                            ],
                          ),
                          SizedBox(height: 2.h),

                          ///Box Size
                          Padding(
                            padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.boxSize.tr,
                                style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.boxSizeLController,
                                    hintText: AppStrings.l.tr,
                                    validator: controller.validateBoxSize,
                                  ),
                                ),
                                CrossWidget(),
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.boxSizeBController,
                                    hintText: AppStrings.b.tr,
                                    validator: controller.validateBoxSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h),

                          ///Box Quantity
                          TextFieldWidget(
                            controller: controller.boxQuantityController,
                            title: AppStrings.boxQuantity.tr,
                            hintText: AppStrings.enterBoxQuantity.tr,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 5,
                            validator: controller.validateBoxQuantity,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 2.h),

                          ///Way Type
                          Padding(
                            padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.wayType.tr,
                                style: AppStyles.size16W600Style,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ///2 way
                              Obx(() {
                                return TypeWidget(
                                  index: 0,
                                  selectedIndex: controller.selectedWayType.value,
                                  title: controller.wayTypeList[0].tr,
                                  selectedType: controller.selectedWayType,
                                );
                              }),
                              SizedBox(width: 2.w),

                              ///4 way
                              Obx(() {
                                return TypeWidget(
                                  index: 1,
                                  selectedIndex: controller.selectedWayType.value,
                                  title: controller.wayTypeList[1].tr,
                                  selectedType: controller.selectedWayType,
                                );
                              }),
                            ],
                          ),
                          SizedBox(height: 2.h),

                          ///Box Purity Type
                          Padding(
                            padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.boxPurityType.tr,
                                style: AppStyles.size16W600Style,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ///Cage
                              Obx(() {
                                return TypeWidget(
                                  index: 0,
                                  selectedIndex: controller.selectedBoxPurityType.value,
                                  title: controller.boxPurityTypeList[0].tr,
                                  selectedType: controller.selectedBoxPurityType,
                                );
                              }),
                              SizedBox(width: 2.w),

                              ///Full
                              Obx(() {
                                return TypeWidget(
                                  index: 1,
                                  selectedIndex: controller.selectedBoxPurityType.value,
                                  title: controller.boxPurityTypeList[1].tr,
                                  selectedType: controller.selectedBoxPurityType,
                                );
                              }),
                            ],
                          ),
                          SizedBox(height: 2.h),

                          ///Top Patiya
                          GestureDetector(
                            onTap: () {
                              controller.enableTopPatiya.toggle();
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Padding(
                              padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppStrings.topPatiya.tr,
                                      style: AppStyles.size16W600Style,
                                    ),
                                    SizedBox(width: 5.w),
                                    Obx(() {
                                      return AnimatedContainer(
                                        duration: Duration(milliseconds: 375),
                                        decoration: BoxDecoration(
                                          color: controller.enableTopPatiya.isTrue ? AppColors.PRIMARY_COLOR : AppColors.SECONDARY_COLOR,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            color: AppColors.PRIMARY_COLOR,
                                            width: 1.2,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.check_rounded,
                                          color: AppColors.SECONDARY_COLOR,
                                          size: 5.w,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),

                          ///Top Patiya Size & Quantity
                          Obx(() {
                            if (controller.enableTopPatiya.isTrue) {
                              return Column(
                                children: [
                                  ///Top Patiya Size
                                  Padding(
                                    padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        AppStrings.topPatiyaSize.tr,
                                        style: AppStyles.size16W600Style,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Flexible(
                                          child: SizeWidget(
                                            sizeController: controller.topPatiyaSizeLController,
                                            hintText: AppStrings.l.tr,
                                          ),
                                        ),
                                        CrossWidget(),
                                        Flexible(
                                          child: SizeWidget(
                                            sizeController: controller.topPatiyaSizeBController,
                                            hintText: AppStrings.b.tr,
                                          ),
                                        ),
                                        CrossWidget(),
                                        Flexible(
                                          child: SizeWidget(
                                            sizeController: controller.topPatiyaSizeHController,
                                            hintText: AppStrings.h.tr,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2.h),

                                  ///Top Patiya Quantity
                                  TextFieldWidget(
                                    controller: controller.topPatiyaQuantityController,
                                    title: AppStrings.topPatiyaQuantity.tr,
                                    hintText: AppStrings.enterTopPatiyaQuantity.tr,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    maxLength: 5,
                                    validator: controller.validateQuantity,
                                    keyboardType: TextInputType.number,
                                  ),
                                  SizedBox(height: 2.h),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          }),

                          ///Sleeper Patiya Size
                          Padding(
                            padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.sleeperPatiyaSize.tr,
                                style: AppStyles.size16W600Style,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.sleeperPatiyaSizeLController,
                                    hintText: AppStrings.l.tr,
                                  ),
                                ),
                                CrossWidget(),
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.sleeperPatiyaSizeBController,
                                    hintText: AppStrings.b.tr,
                                  ),
                                ),
                                CrossWidget(),
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.sleeperPatiyaSizeHController,
                                    hintText: AppStrings.h.tr,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h),

                          ///Sleeper Patiya Quantity
                          TextFieldWidget(
                            controller: controller.sleeperPatiyaQuantityController,
                            title: AppStrings.sleeperPatiyaQuantity.tr,
                            hintText: AppStrings.enterSleeperPatiyaQuantity.tr,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 5,
                            validator: controller.validateQuantity,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 2.h),

                          ///Ghodi Patiya Size
                          Padding(
                            padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.ghodiPatiyaSize.tr,
                                style: AppStyles.size16W600Style,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.ghodiPatiyaSizeLController,
                                    hintText: AppStrings.l.tr,
                                  ),
                                ),
                                CrossWidget(),
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.ghodiPatiyaSizeBController,
                                    hintText: AppStrings.b.tr,
                                  ),
                                ),
                                CrossWidget(),
                                Flexible(
                                  child: SizeWidget(
                                    sizeController: controller.ghodiPatiyaSizeHController,
                                    hintText: AppStrings.h.tr,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h),

                          ///Ghodi Patiya Quantity
                          TextFieldWidget(
                            controller: controller.ghodiPatiyaQuantityController,
                            title: AppStrings.ghodiPatiyaQuantity.tr,
                            hintText: AppStrings.enterGhodiPatiyaQuantity.tr,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            maxLength: 5,
                            validator: controller.validateQuantity,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 2.h),

                          Obx(() {
                            if (controller.selectedWayType.value == 1) {
                              return Column(
                                children: [
                                  ///Block Size
                                  Padding(
                                    padding: EdgeInsets.only(left: context.isPortrait ? 2.w : 1.w),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        AppStrings.blockSize.tr,
                                        style: AppStyles.size16W600Style,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Flexible(
                                          child: SizeWidget(
                                            sizeController: controller.blockSizeBController,
                                            hintText: AppStrings.l.tr,
                                          ),
                                        ),
                                        CrossWidget(),
                                        Flexible(
                                          child: SizeWidget(
                                            sizeController: controller.blockSizeLController,
                                            hintText: AppStrings.b.tr,
                                          ),
                                        ),
                                        CrossWidget(),
                                        Flexible(
                                          child: SizeWidget(
                                            sizeController: controller.blockSizeHController,
                                            hintText: AppStrings.h.tr,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 2.h),

                                  ///Block Quantity
                                  TextFieldWidget(
                                    controller: controller.blockQuantityController,
                                    title: AppStrings.blockQuantity.tr,
                                    hintText: AppStrings.enterBlockQuantity.tr,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    maxLength: 5,
                                    validator: controller.validateQuantity,
                                    keyboardType: TextInputType.number,
                                  ),
                                  SizedBox(height: 2.h),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          }),

                          ///Delivery Date
                          TextFieldWidget(
                            controller: controller.deliveryDateController,
                            title: AppStrings.deliveryDate.tr,
                            hintText: AppStrings.selectDeliveryDate.tr,
                            maxLength: 10,
                            validator: controller.validateDeliveryDate,
                            readOnly: true,
                            onTap: () async {
                              final initialDate = controller.deliveryDateController.text.trim().isEmpty ? DateTime.now() : DateFormat("dd/MM/yyyy").parse(controller.deliveryDateController.text.trim());

                              final selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1970),
                                lastDate: DateTime(2050),
                                initialDate: initialDate,
                                confirmText: AppStrings.select.tr,
                              );

                              if (selectedDate != null) {
                                controller.deliveryDateController.text = DateFormat("dd/MM/yyyy").format(selectedDate);
                              }
                            },
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),

                ///Create Order Button
                Obx(() {
                  return ButtonWidget(
                    onPressed: () async {
                      Utils.unfocus();
                      await controller.createOrderApi();
                    },
                    isLoading: controller.isCreateOrderLoading.isTrue,
                    buttonTitle: AppStrings.createOrder.tr,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SizeWidget({
    required TextEditingController sizeController,
    required String hintText,
    String? Function(String?)? validator,
  }) {
    return TextFieldWidget(
      controller: sizeController,
      hintText: hintText,
      maxLength: 8,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'[0-9.]'),
        ),
      ],
      validator: validator ?? controller.validateSize,
      keyboardType: TextInputType.number,
    );
  }

  Widget TypeWidget({
    required int index,
    required int selectedIndex,
    required String title,
    required RxInt selectedType,
  }) {
    return Flexible(
      child: InkWell(
        onTap: () {
          selectedType(index);
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 375),
              decoration: BoxDecoration(
                color: selectedIndex == index ? AppColors.PRIMARY_COLOR : AppColors.SECONDARY_COLOR,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.PRIMARY_COLOR,
                  width: 1.2,
                ),
              ),
              child: Icon(
                Icons.check_rounded,
                color: AppColors.SECONDARY_COLOR,
                size: 5.w,
              ),
            ),
            SizedBox(width: 2.w),
            Flexible(
              child: Text(
                title,
                style: AppStyles.size16W600Style,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CrossWidget() {
    return SizedBox(
      width: 7.w,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 0.7.h),
          child: Text(
            "×",
            style: TextStyle(
              color: AppColors.PRIMARY_COLOR,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showBottomSheetPartyName() async {
    GlobalKey<FormState> addPartyFormKey = GlobalKey<FormState>();
    TextEditingController addPartyController = TextEditingController();
    return showBottomSheetWidget(
      context: Get.context!,
      builder: (context) {
        final keyboardPadding = MediaQuery.viewInsetsOf(context).bottom;
        return GestureDetector(
          onTap: Utils.unfocus,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.only(bottom: keyboardPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Back & Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h).copyWith(bottom: 0.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Back
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: Icon(
                          Icons.close_rounded,
                          color: AppColors.SECONDARY_COLOR,
                          size: 6.w,
                        ),
                      ),
                      Text(
                        AppStrings.selectParty.tr,
                        style: TextStyle(
                          color: AppColors.SECONDARY_COLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),

                      ///Save
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          AppStrings.select.tr,
                          style: TextStyle(
                            color: AppColors.DARK_GREEN_COLOR,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.HINT_GREY_COLOR,
                  thickness: 1,
                ),
                SizedBox(height: 2.h),

                ///Add new party
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Form(
                    key: addPartyFormKey,
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              controller: addPartyController,
                              hintText: AppStrings.enterPartyName.tr,
                              validator: controller.validatePartyName,
                              primaryColor: AppColors.SECONDARY_COLOR,
                              secondaryColor: AppColors.PRIMARY_COLOR,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              maxLength: 50,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          InkWell(
                            onTap: () {
                              Get.back();
                              controller.partyNameController.text = addPartyController.text.trim();
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: AppColors.SECONDARY_COLOR,
                              ),
                              child: SizedBox(
                                width: 15.w,
                                child: Icon(
                                  Icons.add_rounded,
                                  color: AppColors.PRIMARY_COLOR,
                                  size: 5.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showSelectImageBottomSheet({required int index}) async {
    await showBottomSheetWidget(
      context: Get.context!,
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Back & Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.select.tr,
                      style: TextStyle(
                        color: AppColors.SECONDARY_COLOR,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppColors.SECONDARY_COLOR,
                        size: 6.w,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.HINT_GREY_COLOR,
                  thickness: 1,
                ),
                SizedBox(height: 3.h),

                ///Select Method
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///Gallery
                      InkWell(
                        onTap: () async {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_rounded,
                              color: AppColors.MAIN_BORDER_COLOR,
                              size: 12.w,
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              AppStrings.gallery.tr,
                              style: TextStyle(
                                color: AppColors.SECONDARY_COLOR,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Camera
                      InkWell(
                        onTap: () async {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_camera_rounded,
                              color: AppColors.MAIN_BORDER_COLOR,
                              size: 12.w,
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              AppStrings.camera.tr,
                              style: TextStyle(
                                color: AppColors.SECONDARY_COLOR,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
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
            ),
          ),
        );
      },
    );
  }
}
