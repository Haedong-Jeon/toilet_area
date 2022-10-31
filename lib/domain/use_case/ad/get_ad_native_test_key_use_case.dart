
import 'package:toilet_area/domain/repository/ad/ad_data_repository.dart';

class GetAdNativeTestKeyUseCase {
  final AdDataRepository repository;

  GetAdNativeTestKeyUseCase(this.repository);

  String call() {
    return repository.getAdNativeTestKey();
  }
}