import 'dart:io';

import 'package:toilet_area/data/keys.dart';

class Ad {
  Host _host = Host.android;

  void setPlatform() {
    if (Platform.isAndroid) {
      _host = Host.android;
    } else if (Platform.isIOS) {
      _host = Host.ios;
    }
  }

  String getAdBannerTestKey() {
    return _host == Host.android
        ? APIKey().adAndroidBannerTestKey
        : APIKey().adIosBannerTestKey;
  }

  String getAdForegroundTestKey() {
    return _host == Host.android
        ? APIKey().adAndroidForegroundTestKey
        : APIKey().adIosForegroundTestKey;
  }

  String getAdCompensationTestKey() {
    return _host == Host.android
        ? APIKey().adAndroidCompensationTestKey
        : APIKey().adIosCompensationTestKey;
  }

  String getAdNativeTestKey() {
    return _host == Host.android
        ? APIKey().adAndroidNativeTestKey
        : APIKey().adIosNativeTestKey;
  }
}

enum Host {
  ios,
  android,
}
