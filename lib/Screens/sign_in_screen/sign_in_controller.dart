import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_constance.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Network/models/auth_models/login_model.dart';
import 'package:shree_laxmi_box_stocks/Network/services/auth_services/auth_services.dart';
import 'package:shree_laxmi_box_stocks/Routes/app_pages.dart';

class SignInController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs;

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  RxBool isSignInLoading = false.obs;

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty == true) {
      return AppStrings.pleaseEnterPhoneNumber.tr;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty == true) {
      return AppStrings.pleaseEnterPassword.tr;
    }
    return null;
  }

  Future<void> checkSignIn() async {
    try {
      isSignInLoading(true);
      final isValid = signInFormKey.currentState?.validate();

      if (isValid == true) {
        final response = await AuthServices.loginService(
          phone: phoneController.text,
          password: passwordController.text,
        );

        if (response.isSuccess) {
          LoginModel loginModel = LoginModel.fromJson(response.response?.data);
          if (loginModel.data?.role == null) {
            return;
          } else if (loginModel.data?.role == AppConstance.admin || loginModel.data?.role == AppConstance.employee) {
            Get.offAllNamed(Routes.homeScreen);
          } else {
            Get.offAllNamed(Routes.pendingOrdersScreen);
          }
        }
      }
    } finally {
      isSignInLoading(false);
    }
  }
}
