
import 'package:toilet_area/data/source/ad/ad.dart';
import 'package:toilet_area/domain/repository/ad/ad_data_repository.dart';

class AdDataRepositoryImpl extends AdDataRepository {
  final Ad ad;

  AdDataRepositoryImpl(this.ad) {
    setPlatform();
  }
  @override
  String getAdBannerTestKey() {
   return ad.getAdBannerTestKey();
  }

  @override
  String getAdCompensationTestKey() {
    return ad.getAdCompensationTestKey();
  }

  @override
  String getAdForegroundTestKey() {
    return ad.getAdForegroundTestKey();
  }

  @override
  String getAdNativeTestKey() {
    return ad.getAdNativeTestKey();
  }

  @override
  void setPlatform() {
    return ad.setPlatform();
  }
}