import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class GetToiletListLocalUseCase {
  final ToiletDataRepository repository;
  GetToiletListLocalUseCase(this.repository);
  Future<List<Toilet>> call()async {
    return await repository.getToiletListFromLocal();
  }
}