import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Network/services/order_services/order_services.dart';

class PendingOrdersController extends GetxController {
  RxBool isGetOrdersLoading = false.obs;
  RxList<String> ordersList = RxList();
  RxList<String> searchedOrdersList = RxList();

  TextEditingController searchPartyController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await getOrdersApiCall();
  }

  Future<void> searchPartyName(String searchedValue) async {
    searchedOrdersList.clear();
    if (searchedValue.isNotEmpty) {
      // searchedOrdersList.addAll(ordersList.where((element) => element.partyName?.toLowerCase().contains(searchedValue.toLowerCase()) == true));
    } else {
      searchedOrdersList.addAll(ordersList);
    }
  }

  Future<void> getOrdersApiCall() async {
    try {
      isGetOrdersLoading(true);
      final response = await OrderServices.getOrdersService();

      if (response.isSuccess) {
        // ordersList.clear();
        // searchedOrdersList.clear();
        // ordersList.addAll(getOrdersModel.data ?? []);
        // searchedOrdersList.addAll(getOrdersModel.data ?? []);
      }
    } finally {
      isGetOrdersLoading(false);
    }
  }
}
