
import 'package:toilet_area/domain/repository/ad/ad_data_repository.dart';

class GetAdBannerTestKeyUseCase {
  final AdDataRepository repository;

  GetAdBannerTestKeyUseCase(this.repository);

  String call() {
    return repository.getAdBannerTestKey();
  }
}