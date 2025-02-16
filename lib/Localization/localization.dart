import 'package:get/get.dart';
import 'package:shree_laxmi_box_stocks/Localization/en_in.dart';
import 'package:shree_laxmi_box_stocks/Localization/gu_in.dart';
import 'package:shree_laxmi_box_stocks/Localization/hi_in.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_IN': enIN,
      'hi_IN': hiIN,
      'gu_IN': guIN,
    };
  }
}
