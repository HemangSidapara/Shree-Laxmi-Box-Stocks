import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_assets.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_colors.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_utils.dart';
import 'package:shree_laxmi_box_stocks/Network/models/auth_models/get_latest_version_model.dart';
import 'package:shree_laxmi_box_stocks/Network/services/auth_services/auth_services.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/dashboard_view.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/settings_screen/settings_view.dart';

class HomeController extends GetxController {
  RxInt bottomIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  RxBool isLatestVersionAvailable = false.obs;
  RxString newAPKUrl = ''.obs;
  RxString newAPKVersion = ''.obs;

  RxList<String> listOfImages = [
    AppAssets.homeIcon,
    AppAssets.settingsIcon,
  ].obs;

  RxList<Widget> bottomItemWidgetList = [
    const DashboardView(),
    const SettingsView(),
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.SECONDARY_COLOR,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.SECONDARY_COLOR,
        statusBarBrightness: Brightness.light,
      ),
    );

    await checkTokenApiCall();
  }

  Future<void> onBottomItemChange({required int index}) async {
    bottomIndex.value = index;
    getLatestVersionApiCall();
    pageController.jumpToPage(bottomIndex.value);
  }

  Future<void> getLatestVersionApiCall() async {
    await AuthServices.getLatestVersionService().then((response) async {
      GetLatestVersionModel versionModel = GetLatestVersionModel.fromJson(response.response?.data);
      if (response.isSuccess) {
        newAPKUrl(versionModel.data?.firstOrNull?.appUrl ?? '');
        newAPKVersion(versionModel.data?.firstOrNull?.appVersion ?? '');
        final pkgInfo = await PackageInfo.fromPlatform();
        final currentVersion = pkgInfo.version;
        if (kDebugMode) {
          print('currentVersion :: $currentVersion');
          print('newVersion :: ${newAPKVersion.value}');
        }
        isLatestVersionAvailable.value = Utils.isUpdateAvailable(currentVersion, versionModel.data?.firstOrNull?.appVersion ?? currentVersion);
      }
    });
  }

  Future<void> checkTokenApiCall() async {
    await AuthServices.checkTokenService();
  }
}
