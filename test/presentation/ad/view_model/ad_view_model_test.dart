import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:toilet_area/data/keys.dart';
import 'package:toilet_area/data/repository/ad/ad_data_repository_impl.dart';
import 'package:toilet_area/domain/model/ad/ad.dart';
import 'package:toilet_area/data/source/ad/ad.dart' as ad_source;
import 'package:toilet_area/domain/repository/ad/ad_data_repository.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_banner_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_compensation_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_foreground_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_native_test_key_use_case.dart';
import 'package:toilet_area/presentation/ad/view_model/ad_view_model.dart';

void main() {
  test("광고 아이디 불러오기", () {
    Ad ad = Ad(
      bannerTestKey: ad_source.Ad().getAdBannerTestKey(),
      nativeTestKey: ad_source.Ad().getAdNativeTestKey(),
      compensationTestKey: ad_source.Ad().getAdCompensationTestKey(),
      foregroundTestKey: ad_source.Ad().getAdForegroundTestKey(),
    );
    AdDataRepository adDataRepository = AdDataRepositoryImpl(ad_source.Ad());
    GetAdForegroundTestKeyUseCase getAdForegroundTestKeyUseCase =
        GetAdForegroundTestKeyUseCase(adDataRepository);
    GetAdBannerTestKeyUseCase getAdBannerTestKeyUseCase =
        GetAdBannerTestKeyUseCase(adDataRepository);
    GetAdNativeTestKeyUseCase getAdNativeTestKeyUseCase =
        GetAdNativeTestKeyUseCase(adDataRepository);
    GetAdCompensationTestKeyUseCase getAdCompensationTestKeyUseCase =
        GetAdCompensationTestKeyUseCase(adDataRepository);
    AdViewModel adViewModel = AdViewModel(
      ad,
      getAdBannerTestKeyUseCase,
      getAdNativeTestKeyUseCase,
      getAdForegroundTestKeyUseCase,
      getAdCompensationTestKeyUseCase,
    );
    expect(
      adViewModel.getAdCompensationTestKeyUseCase(),
      Platform.isIOS
          ? "ca-app-pub-3940256099942544/1712485313"
          : "ca-app-pub-3940256099942544/5224354917",
    );
    expect(
      adViewModel.getAdNativeTestKeyUseCase(),
      Platform.isIOS
          ? "ca-app-pub-3940256099942544/3986624511"
          : "ca-app-pub-3940256099942544/2247696110",
    );
    expect(
      adViewModel.getAdForegroundTestKeyUseCase(),
      Platform.isIOS
          ? "ca-app-pub-3940256099942544/4411468910"
          : "ca-app-pub-3940256099942544/1033173712",
    );
    expect(
      adViewModel.getAdBannerTestKeyUseCase(),
      Platform.isIOS
          ? "ca-app-pub-3940256099942544/2934735716"
          : "ca-app-pub-3940256099942544/6300978111",
    );
  });
}
