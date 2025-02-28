import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_utils.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_validators.dart';
import 'package:shree_laxmi_box_stocks/Network/models/order_models/get_parties_model.dart' as get_parties;
import 'package:shree_laxmi_box_stocks/Network/services/order_services/order_services.dart';

class CreateOrderController extends GetxController {
  GlobalKey<FormState> createOrderFormKey = GlobalKey<FormState>();

  TextEditingController partyNameController = TextEditingController();
  TextEditingController partyPhoneController = TextEditingController();
  TextEditingController partyEmailController = TextEditingController();
  TextEditingController purchaseOrderNumberController = TextEditingController();
  List<String> boxTypeList = [
    AppStrings.pellet,
    AppStrings.box,
    AppStrings.cage,
  ];
  RxInt selectedBoxType = (-1).obs;
  TextEditingController boxSizeLController = TextEditingController();
  TextEditingController boxSizeBController = TextEditingController();
  TextEditingController boxQuantityController = TextEditingController();
  List<String> wayTypeList = [
    AppStrings.twoWay,
    AppStrings.fourWay,
  ];
  RxInt selectedWayType = (-1).obs;
  List<String> boxPurityTypeList = [
    AppStrings.cage,
    AppStrings.full,
  ];
  RxInt selectedBoxPurityType = (-1).obs;
  RxBool enableTopPatiya = false.obs;
  TextEditingController topPatiyaSizeLController = TextEditingController();
  TextEditingController topPatiyaSizeBController = TextEditingController();
  TextEditingController topPatiyaSizeHController = TextEditingController();
  TextEditingController topPatiyaQuantityController = TextEditingController();
  TextEditingController sleeperPatiyaSizeLController = TextEditingController();
  TextEditingController sleeperPatiyaSizeBController = TextEditingController();
  TextEditingController sleeperPatiyaSizeHController = TextEditingController();
  TextEditingController sleeperPatiyaQuantityController = TextEditingController();
  TextEditingController ghodiPatiyaSizeLController = TextEditingController();
  TextEditingController ghodiPatiyaSizeBController = TextEditingController();
  TextEditingController ghodiPatiyaSizeHController = TextEditingController();
  TextEditingController ghodiPatiyaQuantityController = TextEditingController();
  TextEditingController blockSizeLController = TextEditingController();
  TextEditingController blockSizeBController = TextEditingController();
  TextEditingController blockSizeHController = TextEditingController();
  TextEditingController blockQuantityController = TextEditingController();
  TextEditingController deliveryDateController = TextEditingController();

  RxBool isGetPartiesLoading = true.obs;
  RxList<get_parties.PartyData> partyList = RxList();
  RxList<get_parties.PartyData> searchPartyList = RxList();
  RxInt selectedPartyId = (-1).obs;
  RxBool isCreateOrderLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getPartiesApi();
  }

  String? validatePartyName(String? value) {
    if (value == null || value.isEmpty == true) {
      return AppStrings.pleaseEnterPartyName.tr;
    }
    return null;
  }

  String? validatePartyList(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseSelectParty.tr;
    }
    return null;
  }

  String? validatePartyPhone(String? value) {
    if (value != null && value.isNotEmpty && value.length < 10 && !value.isNum) {
      return AppStrings.pleaseEnterValidPhoneNumber.tr;
    }
    return null;
  }

  String? validatePartyEmail(String? value) {
    if (value != null && value.isNotEmpty && !AppValidators.emailValidator.hasMatch(value)) {
      return AppStrings.pleaseEnterValidEmail.tr;
    }
    return null;
  }

  String? validatePurchaseOrderNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterPurchaseOrderNumber.tr;
    }
    return null;
  }

  String? validateBoxSize(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterBoxSize.tr;
    } else if (!AppValidators.doubleValidator.hasMatch(value)) {
      return AppStrings.pleaseEnterValidBoxSize.tr;
    }
    return null;
  }

  String? validateBoxQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterBoxQuantity.tr;
    }
    return null;
  }

  String? validateSize(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterSize.tr;
    } else if (!AppValidators.doubleValidator.hasMatch(value)) {
      return AppStrings.pleaseEnterValidSize.tr;
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterQuantity.tr;
    }
    return null;
  }

  String? validateDeliveryDate(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterQuantity.tr;
    }
    return null;
  }

  Future<RxList<get_parties.PartyData>> getPartiesApi() async {
    try {
      isGetPartiesLoading(true);
      final response = await OrderServices.getPartiesService();
      if (response.isSuccess) {
        get_parties.GetPartiesModel getPartiesModel = get_parties.GetPartiesModel.fromJson(response.response?.data);
        partyList.clear();
        searchPartyList.clear();
        partyList.addAll(getPartiesModel.data ?? []);
        searchPartyList.addAll(getPartiesModel.data ?? []);
      }
      return partyList;
    } finally {
      isGetPartiesLoading(false);
    }
  }

  Future<void> checkEditParty({
    required String partyId,
    required String partyName,
    required String partyPhone,
  }) async {
    try {
      isGetPartiesLoading(true);
      final response = await OrderServices.editPartyService(
        partyId: partyId,
        partyName: partyName,
        partyPhone: partyPhone,
      );

      if (response.isSuccess) {
        await getPartiesApi();
        partyNameController.text = partyName;
        partyPhoneController.text = partyPhone;
        Get.back();
        Utils.handleMessage(message: response.message);
      }
    } finally {
      isGetPartiesLoading(false);
    }
  }

  Future<void> createOrderApi() async {
    try {
      isCreateOrderLoading(true);
      final isValidate = createOrderFormKey.currentState?.validate();

      if (selectedBoxType.value == -1) {
        Utils.handleMessage(message: AppStrings.pleaseSelectBoxType.tr, isError: true);
        return;
      } else if (selectedWayType.value == -1) {
        Utils.handleMessage(message: AppStrings.pleaseSelectWayType.tr, isError: true);
        return;
      } else if (selectedBoxPurityType.value == -1) {
        Utils.handleMessage(message: AppStrings.pleaseSelectBoxPurityType.tr, isError: true);
        return;
      } else if (isValidate == true) {
        final response = await OrderServices.createOrderService(
          partyName: partyNameController.text.trim(),
          partyPhone: partyPhoneController.text.trim(),
          partyEmail: partyEmailController.text.trim(),
          purchaseOrderNumber: purchaseOrderNumberController.text.trim(),
          boxType: boxTypeList[selectedBoxType.value],
          boxSize: "${boxSizeLController.text.trim()}X${boxSizeBController.text.trim()}",
          boxQuantity: boxQuantityController.text.trim(),
          wayType: wayTypeList[selectedWayType.value],
          boxPurity: boxPurityTypeList[selectedBoxPurityType.value],
          isTop: enableTopPatiya.isTrue,
          topPatiyaSize: enableTopPatiya.isTrue ? "${topPatiyaSizeLController.text.trim()}X${topPatiyaSizeBController.text.trim()}X${topPatiyaSizeHController.text.trim()}" : "",
          topPatiyaQuantity: enableTopPatiya.isTrue ? topPatiyaQuantityController.text.trim() : "",
          sleeperPatiyaSize: "${sleeperPatiyaSizeLController.text.trim()}X${sleeperPatiyaSizeBController.text.trim()}X${sleeperPatiyaSizeHController.text.trim()}",
          sleeperPatiyaQuantity: sleeperPatiyaQuantityController.text.trim(),
          ghodiPatiyaSize: "${ghodiPatiyaSizeLController.text.trim()}X${ghodiPatiyaSizeBController.text.trim()}X${ghodiPatiyaSizeHController.text.trim()}",
          ghodiPatiyaQuantity: ghodiPatiyaQuantityController.text.trim(),
          blockSize: selectedWayType.value == 1 ? "${blockSizeLController.text.trim()}X${blockSizeBController.text.trim()}X${blockSizeHController.text.trim()}" : "",
          blockQuantity: selectedWayType.value == 1 ? blockQuantityController.text.trim() : "",
          deliveryDate: deliveryDateController.text.trim(),
        );

        if (response.isSuccess) {
          Get.back();
          Utils.handleMessage(message: response.message);
        }
      }
    } finally {
      isCreateOrderLoading(false);
    }
  }
}
