class ApiUrls {
  static const String baseUrl = 'https://shreelaxmibox.linkerbite.com/';
  static const String _apiPath = 'api/v1/';

  /// Users Urls
  static const String loginApi = '${_apiPath}users/login';
  static const String getPartiesApi = '${_apiPath}users/getParties';
  static const String editPartyApi = '${_apiPath}users/editParty';

  /// Orders Urls
  static const String createOrderApi = '${_apiPath}orders/createOrder';
  static const String getOrdersApi = '${_apiPath}orders/getOrders';
}
