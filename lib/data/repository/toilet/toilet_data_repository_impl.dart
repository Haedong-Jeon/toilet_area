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
  Future<List<Toilet>> getToiletListFromRemote(int page) async {
    List<Toilet> toilets =[];
    if (remoteDataSource == null) {
      throw Error();
    }
    try {
      final response = await remoteDataSource!.getToiletListFromRemote(page);
      response.data["data"]["toilet_list"].forEach((e){
        toilets.add(Toilet.fromJson(e));
      });
      return toilets;
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

  @override
  String getKakaoMapKey() {
    return remoteDataSource!.getKakaoMapKey();
  }
}
