import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class GetToiletListFromRemoteUseCase {
  final ToiletDataRepository repository;

  GetToiletListFromRemoteUseCase(this.repository);

  Future<List<Toilet>> call(int page,
      {double userLat = 0, double userLng = 0}) async {
    try {
      return await repository.getToiletListFromRemote(page,
          userLat: userLat, userLng: userLng);
    } catch (e) {
      rethrow;
    }
  }
}
