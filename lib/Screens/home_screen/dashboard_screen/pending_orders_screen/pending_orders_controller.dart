import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Network/models/order_models/get_orders_model.dart' as get_orders;
import 'package:shree_laxmi_box_stocks/Network/services/order_services/order_services.dart';

class PendingOrdersController extends GetxController {
  RxBool isGetOrdersLoading = false.obs;
  RxList<get_orders.Party> ordersList = RxList();
  RxList<get_orders.Party> searchedOrdersList = RxList();

  TextEditingController searchPartyController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await getOrdersApiCall();
  }

  Future<void> searchPartyName(String searchedValue) async {
    searchedOrdersList.clear();
    if (searchedValue.isNotEmpty) {
      searchedOrdersList.addAll(ordersList.where((element) => element.partyName?.toLowerCase().contains(searchedValue.toLowerCase()) == true));
    } else {
      searchedOrdersList.addAll(ordersList);
    }
  }

  Future<void> getOrdersApiCall() async {
    try {
      isGetOrdersLoading(true);
      final response = await OrderServices.getOrdersService();

      if (response.isSuccess) {
        get_orders.GetOrdersModel getOrdersModel = get_orders.GetOrdersModel.fromJson(response.response?.data);
        ordersList.clear();
        searchedOrdersList.clear();
        ordersList.addAll(getOrdersModel.data ?? []);
        searchedOrdersList.addAll(getOrdersModel.data ?? []);
      }
    } finally {
      isGetOrdersLoading(false);
    }
  }
}
