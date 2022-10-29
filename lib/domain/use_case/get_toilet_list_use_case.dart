import 'package:toilet_area/domain/repository/toilet_data_repository.dart';
import 'package:dio/dio.dart';

class GetToiletListUseCase {
  final ToiletDataRepository repository;
  GetToiletListUseCase(this.repository);

  Future<Response> call() async {
    return await repository.getToiletList();
  }
}