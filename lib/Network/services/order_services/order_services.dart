import 'package:flutter/foundation.dart';
import 'package:shree_laxmi_box_stocks/Constants/api_keys.dart';
import 'package:shree_laxmi_box_stocks/Constants/api_urls.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_utils.dart';
import 'package:shree_laxmi_box_stocks/Network/api_base_helper.dart';
import 'package:shree_laxmi_box_stocks/Network/response_model.dart';

class OrderServices {
  /// Get Parties
  static Future<ResponseModel> getPartiesService() async {
    final response = await ApiBaseHelper.getHTTP(
      "",
      showProgress: false,
      onError: (dioExceptions) {
        Utils.handleMessage(message: dioExceptions.message, isError: true);
      },
      onSuccess: (res) {
        if (res.isSuccess) {
          if (kDebugMode) {
            print("getPartiesApi success :: ${res.message}");
          }
        } else {
          if (kDebugMode) {
            print("getPartiesApi error :: ${res.message}");
          }
          Utils.handleMessage(message: res.message, isError: true);
        }
      },
    );
    return response;
  }

  /// Create Order
  static Future<ResponseModel> createOrderService({
    required String partyName,
    required String partyPhone,
    required String partyEmail,
    required String purchaseOrderNumber,
    required String boxType,
    required String boxSize,
    required String boxQuantity,
    required String wayType,
    required String boxPurity,
    required bool isTop,
    required String topPatiyaSize,
    required String topPatiyaQuantity,
    required String sleeperPatiyaSize,
    required String sleeperPatiyaQuantity,
    required String ghodiPatiyaSize,
    required String ghodiPatiyaQuantity,
    required String blockSize,
    required String blockQuantity,
    required String deliveryDate,
  }) async {
    final params = {
      ApiKeys.partyName: partyName,
      ApiKeys.partyPhone: partyPhone,
      ApiKeys.partyEmail: partyEmail,
      ApiKeys.purchaseOrderNumber: purchaseOrderNumber,
      ApiKeys.boxType: boxType,
      ApiKeys.boxSize: boxSize,
      ApiKeys.boxQuantity: boxQuantity,
      ApiKeys.wayType: wayType,
      ApiKeys.boxPurity: boxPurity,
      ApiKeys.isTop: isTop,
      ApiKeys.topPatiyaSize: topPatiyaSize,
      ApiKeys.topPatiyaQuantity: topPatiyaQuantity,
      ApiKeys.sleeperPatiyaSize: sleeperPatiyaSize,
      ApiKeys.sleeperPatiyaQuantity: sleeperPatiyaQuantity,
      ApiKeys.ghodiPatiyaSize: ghodiPatiyaSize,
      ApiKeys.ghodiPatiyaQuantity: ghodiPatiyaQuantity,
      ApiKeys.blockSize: blockSize,
      ApiKeys.blockQuantity: blockQuantity,
      ApiKeys.deliveryDate: deliveryDate,
    };
    final response = await ApiBaseHelper.postHTTP(
      ApiUrls.createOrderApi,
      params: params,
      showProgress: false,
      onError: (dioExceptions) {
        Utils.handleMessage(message: dioExceptions.message, isError: true);
      },
      onSuccess: (res) {
        if (res.isSuccess) {
          if (kDebugMode) {
            print("createOrderApi success :: ${res.message}");
          }
        } else {
          if (kDebugMode) {
            print("createOrderApi error :: ${res.message}");
          }
          Utils.handleMessage(message: res.message, isError: true);
        }
      },
    );
    return response;
  }
}
