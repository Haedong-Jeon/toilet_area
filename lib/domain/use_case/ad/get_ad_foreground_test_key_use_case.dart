
import 'package:toilet_area/domain/repository/ad/ad_data_repository.dart';

class GetAdForegroundTestKeyUseCase {
  final AdDataRepository repository;

  GetAdForegroundTestKeyUseCase(this.repository);

  String call() {
    return repository.getAdForegroundTestKey();
  }
}