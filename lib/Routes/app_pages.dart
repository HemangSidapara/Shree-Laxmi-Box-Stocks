import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/create_order_screen/create_order_bindings.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/create_order_screen/create_order_view.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/dashboard_bindings.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/pending_orders_screen/pending_orders_bindings.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/dashboard_screen/pending_orders_screen/pending_orders_view.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/home_bindings.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/home_view.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/settings_screen/settings_bindings.dart';
import 'package:shree_laxmi_box_stocks/Screens/home_screen/settings_screen/settings_view.dart';
import 'package:shree_laxmi_box_stocks/Screens/sign_in_screen/sign_in_bindings.dart';
import 'package:shree_laxmi_box_stocks/Screens/sign_in_screen/sign_in_view.dart';
import 'package:shree_laxmi_box_stocks/Screens/splash_screen/splash_bindings.dart';
import 'package:shree_laxmi_box_stocks/Screens/splash_screen/splash_view.dart';

part 'app_routes.dart';

Duration transitionDuration = const Duration(milliseconds: 400);

class AppPages {
  static final pages = [
    ///Splash Screen
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashView(),
      binding: SplashBindings(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
    ),

    ///SignIn Screen
    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInView(),
      binding: SignInBindings(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
    ),

    ///Home Screen
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeView(),
      binding: HomeBindings(),
      bindings: [
        DashboardBindings(),
        SettingsBindings(),
      ],
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
    ),

    ///Settings
    GetPage(
      name: Routes.settingsScreen,
      page: () => const SettingsView(),
      binding: SettingsBindings(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
    ),

    ///Create Order Screen
    GetPage(
      name: Routes.createOrderScreen,
      page: () => const CreateOrderView(),
      binding: CreateOrderBindings(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
    ),

    ///Order Details Screen
    GetPage(
      name: Routes.pendingOrdersScreen,
      page: () => const PendingOrdersView(),
      binding: PendingOrdersBindings(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
    ),
  ];
}
