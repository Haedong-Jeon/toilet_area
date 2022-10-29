import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_source.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class ToiletDataRepositoryImpl extends ToiletDataRepository {
  final ToiletDataSource dataSource;
  ToiletDataRepositoryImpl(this.dataSource);

  @override
  Future<Response> getToiletListFromRemote() async {
    return await dataSource.getToiletListFromRemote();
  }
}