import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toilet_area/data/repository/ad/ad_data_repository_impl.dart';
import 'package:toilet_area/data/source/ad/ad.dart' as adSource;
import 'package:toilet_area/domain/model/ad/ad.dart';
import 'package:toilet_area/domain/repository/ad/ad_data_repository.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_banner_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_compensation_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_foreground_test_key_use_case.dart';
import 'package:toilet_area/domain/use_case/ad/get_ad_native_test_key_use_case.dart';
import 'package:toilet_area/presentation/ad/view_model/ad_view_model.dart';

late final StateNotifierProvider<AdViewModel, Ad> adViewModelProvider;

Future setUp() async {
  AdDataRepository adDataRepository = AdDataRepositoryImpl(adSource.Ad());

  GetAdCompensationTestKeyUseCase getAdCompensationTestKeyUseCase = GetAdCompensationTestKeyUseCase(adDataRepository);
  GetAdBannerTestKeyUseCase getAdBannerTestKeyUseCase = GetAdBannerTestKeyUseCase(adDataRepository);
  GetAdNativeTestKeyUseCase getAdNativeTestKeyUseCase = GetAdNativeTestKeyUseCase(adDataRepository);
  GetAdForegroundTestKeyUseCase getAdForegroundTestKeyUseCase = GetAdForegroundTestKeyUseCase(adDataRepository);
  AdViewModel _adViewModel = AdViewModel(
    Ad(
      bannerTestKey: adSource.Ad().getAdBannerTestKey(),
      nativeTestKey: adSource.Ad().getAdNativeTestKey(),
      compensationTestKey: adSource.Ad().getAdCompensationTestKey(),
      foregroundTestKey: adSource.Ad().getAdForegroundTestKey(),
    ),
    getAdBannerTestKeyUseCase,
    getAdNativeTestKeyUseCase,
    getAdForegroundTestKeyUseCase,
    getAdCompensationTestKeyUseCase,
  );

  adViewModelProvider = StateNotifierProvider<AdViewModel, Ad>((ref) => _adViewModel);
}
