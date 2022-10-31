import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class GetToiletListFromRemoteUseCase {
  final ToiletDataRepository repository;

  GetToiletListFromRemoteUseCase(this.repository);

  Future<List<Toilet>> call(int page) async {
    try {
      return await repository.getToiletListFromRemote(page);
    } catch (e) {
      rethrow;
    }
  }
}
