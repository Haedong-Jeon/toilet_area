
import 'package:toilet_area/domain/repository/ad/ad_data_repository.dart';

class GetAdCompensationTestKeyUseCase {
  final AdDataRepository repository;

  GetAdCompensationTestKeyUseCase(this.repository);

  String call() {
    return repository.getAdCompensationTestKey();
  }
}