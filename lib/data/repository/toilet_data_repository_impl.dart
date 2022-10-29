import 'package:toilet_area/data/source/toilet_data_source.dart';
import 'package:toilet_area/domain/repository/toilet_data_repository.dart';
import 'package:dio/dio.dart';

class ToiletDataRepositoryImpl extends ToiletDataRepository {
  final ToiletDataSource dataSource;
  ToiletDataRepositoryImpl(this.dataSource);

  @override
  Future<Response> getToiletData() async {
    return await dataSource.getToiletData();
  }
}