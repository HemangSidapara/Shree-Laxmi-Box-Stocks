import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_colors.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_constance.dart';
import 'package:shree_laxmi_box_stocks/Constants/app_strings.dart';
import 'package:shree_laxmi_box_stocks/Constants/get_storage.dart';
import 'package:shree_laxmi_box_stocks/Localization/localization.dart';
import 'package:shree_laxmi_box_stocks/Routes/app_pages.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([]);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          translations: Localization(),
          locale: getString(AppConstance.languageCode) != null && getString(AppConstance.languageCode) != '' && getString(AppConstance.languageCountryCode) != null && getString(AppConstance.languageCountryCode) != '' ? Locale(getString(AppConstance.languageCode) ?? Get.deviceLocale?.languageCode ?? 'en', getString(AppConstance.languageCountryCode)) : Get.deviceLocale,
          fallbackLocale: const Locale('en', 'IN'),
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.SECONDARY_COLOR,
            primaryColor: AppColors.PRIMARY_COLOR,
            textTheme: GoogleFonts.nunitoSansTextTheme(),
            colorScheme: ColorScheme.light(
              onPrimary: AppColors.PRIMARY_COLOR,
              primary: AppColors.DARK_GREEN_COLOR,
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: AppColors.PRIMARY_COLOR,
              headerBackgroundColor: AppColors.SECONDARY_COLOR,
              dividerColor: AppColors.HINT_GREY_COLOR,
              headerForegroundColor: AppColors.PRIMARY_COLOR,
              headerHelpStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
              headerHeadlineStyle: TextStyle(
                color: AppColors.PRIMARY_COLOR,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              cancelButtonStyle: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll<Color>(AppColors.DARK_RED_COLOR),
                textStyle: WidgetStatePropertyAll<TextStyle>(
                  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              confirmButtonStyle: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll<Color>(AppColors.DARK_GREEN_COLOR),
                textStyle: WidgetStatePropertyAll<TextStyle>(
                  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              dayForegroundColor: WidgetStatePropertyAll<Color>(AppColors.SECONDARY_COLOR),
              dayStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              todayBorder: BorderSide(color: AppColors.DARK_GREEN_COLOR),
              surfaceTintColor: AppColors.DARK_GREEN_COLOR,
              yearStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              elevation: 4,
              weekdayStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  color: AppColors.SECONDARY_COLOR,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.SECONDARY_COLOR,
                  ),
                ),
                outlineBorder: BorderSide(
                  color: AppColors.SECONDARY_COLOR,
                ),
              ),
            ),
            useMaterial3: true,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.SECONDARY_COLOR,
              selectionHandleColor: AppColors.DARK_GREEN_COLOR,
              selectionColor: AppColors.DARK_GREEN_COLOR,
            ),
          ),
          initialRoute: Routes.splashScreen,
          defaultTransition: Transition.downToUp,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
