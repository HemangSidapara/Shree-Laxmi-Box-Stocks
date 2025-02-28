import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Constants/api_keys.dart';
import 'package:shree_laxmi_box_stocks/Constants/api_urls.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_constance.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_utils.dart';
import 'package:shree_laxmi_box_stocks/Constants/get_storage.dart';
import 'package:shree_laxmi_box_stocks/Network/api_base_helper.dart';
import 'package:shree_laxmi_box_stocks/Network/models/auth_models/get_latest_version_model.dart';
import 'package:shree_laxmi_box_stocks/Network/models/auth_models/login_model.dart';
import 'package:shree_laxmi_box_stocks/Network/response_model.dart';
import 'package:shree_laxmi_box_stocks/Routes/app_pages.dart';

class AuthServices {
  static Future<ResponseModel> getLatestVersionService() async {
    final response = await ApiBaseHelper.getHTTP(
      "",
      showProgress: false,
      onError: (dioExceptions) {
        if (kDebugMode) {
          print("❌ inAppUpdateApi OnError: ${dioExceptions.message}");
        }
        Utils.handleMessage(message: dioExceptions.message, isError: true);
      },
      onSuccess: (res) async {
        if (res.isSuccess) {
          GetLatestVersionModel latestVersionModel = GetLatestVersionModel.fromJson(res.response?.data);
          if (kDebugMode) {
            print("✅ inAppUpdateApi Success: ${res.message}");
          }
        } else {
          if (kDebugMode) {
            print("❌ inAppUpdateApi Error: ${res.message}");
          }
        }
      },
    );

    return response;
  }

  static Future<ResponseModel> loginService({
    required String phone,
    required String password,
  }) async {
    final params = {
      ApiKeys.phoneNumber: phone,
      ApiKeys.password: password,
    };
    final response = await ApiBaseHelper.postHTTP(
      ApiUrls.loginApi,
      params: params,
      onError: (dioExceptions) {
        if (kDebugMode) {
          print("❌ loginApi OnError: ${dioExceptions.message}");
        }
        Utils.handleMessage(message: dioExceptions.message, isError: true);
      },
      onSuccess: (res) async {
        if (res.isSuccess) {
          LoginModel loginModel = LoginModel.fromJson(res.response?.data);
          await setData(AppConstance.authorizationToken, loginModel.token);
          await setData(AppConstance.role, loginModel.data?.role);
          await setData(AppConstance.userName, loginModel.data?.userName);
          if (kDebugMode) {
            print("✅ loginApi Success: ${res.message}");
          }
          Utils.handleMessage(message: loginModel.message);
        } else {
          if (kDebugMode) {
            print("❌ loginApi Error: ${res.message}");
          }
          Utils.handleMessage(message: res.message, isError: true);
        }
      },
    );

    return response;
  }

  static Future<ResponseModel> checkTokenService() async {
    final response = await ApiBaseHelper.getHTTP(
      "",
      onError: (dioExceptions) {
        if (kDebugMode) {
          print("❌ checkTokenApi OnError: ${dioExceptions.message}");
        }
        Utils.handleMessage(message: dioExceptions.message, isError: true);
      },
      showProgress: false,
      onSuccess: (res) async {
        if (res.isSuccess) {
          if (kDebugMode) {
            print("✅ checkTokenApi Success: ${res.message}");
          }
        } else if (res.statusCode == 498) {
          if (kDebugMode) {
            print("❌ checkTokenApi Error: ${res.message}");
          }
          Get.offAllNamed(Routes.signInScreen);
          Utils.handleMessage(message: AppStrings.sessionExpire.tr, isError: true);
          clearData();
        } else {
          if (kDebugMode) {
            print("❌ checkTokenApi Error: ${res.message}");
          }
          Utils.handleMessage(message: res.message, isError: true);
        }
      },
    );

    return response;
  }
}
