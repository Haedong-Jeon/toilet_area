import 'package:dio/dio.dart';
import 'package:toilet_area/data/source/toilet/local/toilet_db_helper.dart';
import 'package:toilet_area/data/source/toilet/remote/toilet_data_remote_source.dart';
import 'package:toilet_area/domain/model/toilet/toilet.dart';
import 'package:toilet_area/domain/repository/toilet/toilet_data_repository.dart';

class ToiletDataRepositoryImpl extends ToiletDataRepository {
  ToiletDataRemoteSource? remoteDataSource;
  ToiletDbHelper? toiletDbHelper;

  ToiletDataRepositoryImpl(this.remoteDataSource, this.toiletDbHelper);

  @override
  Future<Response?> getToiletListFromRemote(int page) async {
    if (remoteDataSource == null) {
      return null;
    }
    try {
      final response = await remoteDataSource!.getToiletListFromRemote(page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getToiletListFromLocal() async {
    if (toiletDbHelper == null) {
      return;
    }
    try {
      return await toiletDbHelper!.getToiletListFromLocal();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future saveToiletList(List<Toilet> toiletsFromRemote) async {
    if (toiletDbHelper == null) {
      return;
    }
    return await toiletDbHelper!.saveToiletList(toiletsFromRemote);
  }
}
