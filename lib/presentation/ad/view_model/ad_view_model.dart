import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/domain/model/ad/ad.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_banner_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_compensation_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_foreground_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_native_test_key_use_case.dart';

class AdViewModel extends StateNotifier<Ad> {
  AdViewModel(
      super.state,
      this.getAdBannerTestKeyUseCase,
      this.getAdNativeTestKeyUseCase,
      this.getAdForegroundTestKeyUseCase,
      this.getAdCompensationTestKeyUseCase)
      : super();
  final GetAdBannerTestKeyUseCase getAdBannerTestKeyUseCase;
  final GetAdNativeTestKeyUseCase getAdNativeTestKeyUseCase;
  final GetAdForegroundTestKeyUseCase getAdForegroundTestKeyUseCase;
  final GetAdCompensationTestKeyUseCase getAdCompensationTestKeyUseCase;

  String getBannerTestKey() {
    return getAdBannerTestKeyUseCase();
  }

  String getForegroundTestKey() {
    return getAdForegroundTestKeyUseCase();
  }

  String getNativeTestKey() {
    return getAdNativeTestKeyUseCase();
  }

  String getCompensationTestKey() {
    return getAdCompensationTestKeyUseCase();
  }
}
