import 'dart:io';

import 'package:device_info/device_info.dart';

class PlatformUtils {
  const PlatformUtils._();

  static Future<String> get deviceUniqueId async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      return 'AND-${(await deviceInfo.androidInfo).androidId}';
    } else if (Platform.isIOS) {
      return 'IOS-${(await deviceInfo.iosInfo).identifierForVendor}';
    } else {
      return null;
    }
  }

  static String get platformName {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else {
      return 'Unknown';
    }
  }

  static String get platformLanguage {
    String locale = Platform.localeName;

    if (locale.length == 5) {
      return locale;
    } else if (locale == 'fr') {
      return 'fr_FR';
    } else {
      return 'en_US';
    }
  }

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;
}
