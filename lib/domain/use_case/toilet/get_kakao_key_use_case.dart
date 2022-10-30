import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class GetKakaoKeyUseCase {
  final ToiletDataRepository repository;
  GetKakaoKeyUseCase(this.repository);

  String call() {
    return repository.getKakaoMapKey();
  }
}