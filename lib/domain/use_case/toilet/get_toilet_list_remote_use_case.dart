import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';
import 'package:dio/dio.dart';

class GetToiletListFromRemoteUseCase {
  final ToiletDataRepository repository;

  GetToiletListFromRemoteUseCase(this.repository);

  Future<Response> call(int page) async {
    try {
      return await repository.getToiletListFromRemote(page);
    } catch (e) {
      rethrow;
    }
  }
}
