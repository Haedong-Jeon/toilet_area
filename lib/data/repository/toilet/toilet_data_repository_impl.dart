import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class ToiletDataRepositoryImpl extends ToiletDataRepository {
  final ToiletDataRemoteSource remoteDataSource;
  ToiletDataRepositoryImpl(this.remoteDataSource);

  @override
  Future<Response> getToiletListFromRemote() async {
    return await remoteDataSource.getToiletListFromRemote();
  }

  @override
  Future getToiletListFromLocal() async {
    // TODO: implement getToiletListFromLocal
    throw UnimplementedError();
  }

  @override
  Future saveToiletList() async {
    // TODO: implement saveToiletList
    throw UnimplementedError();
  }
}